-- LSP設定集
local mappings = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<leader>fl"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" } })
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" } })
      end,
      "Goto next",
    },

    ["<leader>Q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>woa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wor"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wol"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format()
      end,
      "format",
    }
  },
}


return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  dependencies = {
    "folke/neoconf.nvim",
  },
  config = function()
    require("core.utils").load_mappings(mappings)

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --   border = "single",
    -- })

    -- INFO: dependencies efm-langserver
    -- scoop install go
    -- go install github.com/mattn/efm-langserver@latest

    require("lspconfig").efm.setup({
      init_options = { documentFormatting = true, codeAction = false },
      filetypes = {
        "lua",
        "python",
        "markdown",
      },
      settings = {
        rootMakers = { ".git/" },
        language = {
          lua = {
            { formatCommand = "lua-format -i", formatStdin = true },
          },
          python = {
            -- INFO: poetry add ruff black mypy --dev
            { formatCommand = "ruff check --fix ${INPUT}" },
            { formatCommand = "black --quiet --safe ${INPUT}" },
            {
              lintCommand = "mypy --show-column-numbers --strict --strict-equality",
              lintFormats = { "%f:%l:%c: %t%*[^:]: %m" },
              lintSource = "mypy",
              lintStdin = true,
            },
          },
          markdown = {
            { -- INFO: scoop install pandoc
              formatCommand = "pandoc -f markdown --to=markdown --tab-stop=2 -t gfm -sp",
              formatStdin = true,
            },
            { -- INFO: install markdownlint with Mason.
              lintCommand = "markdownlint -s -c ~/.config/.markdownlintrc",
              lintStdin = true,
              lintFormats = {
                '%f:%l %m',
                '%f:%l:%c %m',
                '%f: %l: %m',
              },
            }
          },
        }
      },
    })

    vim.api.nvim_create_autocmd(
      { "BufWritePre" },
      {
        callback = function()
          vim.lsp.buf.format()
        end
      }
    )
  end
}
