-- git の見た目
return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  cmd = { "Gitsigns" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
      on_attach = function()
        -- require("core.utils").load_mappings("gitsigns", { buffer = bufnr })
      end,
    })
  end,
}
