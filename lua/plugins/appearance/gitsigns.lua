-- git の見た目
local options = {
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
}

return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  config = function()
    require("gitsigns").setup(options)
  end,
}
