-- メモコメントを色付け、telescopeで検索可能にする
local mappings = {
  n = {
    ["<leader>ft"] = {
      "<cmd> TodoTelescope <CR>",
      "Todo検索",
    },
  },
}

return {
  "folke/todo-comments.nvim",
  cmd = "TodoTelescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = true,
}
