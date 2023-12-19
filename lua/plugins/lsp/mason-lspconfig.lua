-- masonでインストールしたlanguage serverをnvim-lspconfigで自動セットアップする
return {
  "williamboman/mason-lspconfig.nvim",
  event = "BufReadPost",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "SmiteshP/nvim-navbuddy",
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "rust_analyzer" },
    })
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")

    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end

    require("mason-lspconfig").setup_handlers({
      function(server_name) -- デフォルトの設定
        require("lspconfig")[server_name].setup({
          on_attach = on_attach,
        })
      end,
      -- INFO: デフォルト以外の設定は個別に設定する
      ["typos_lsp"] = function()
        require("lspconfig").typos_lsp.setup({})
      end,
      ["ruff_lsp"] = function()
        require("lspconfig").ruff_lsp.setup({
          -- on_attach = on_attach,
          init_option = {
            settings = {
              args = {},
            }
          }
        })
      end,
    })
  end,
}
