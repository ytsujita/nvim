-- コードの問題点を一覧で表示
local mappings = {
  n = {
    -- find trouble
    ["<Leader>ft"] = { "<cmd> TroubleToggle <CR>", "問題一覧ウィンドウを開く" },
  },
}

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle" },
  keys = {
    { "<Leader>ft", "<cmd> TroubleToggle <CR>", desc = "問題一覧ウィンドウを開く", mode = "n" },
  },
  cond = function()
    return vim.g.vscode == nil
  end,
  lazy = true,
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    position = "right",
    width = 100,
  },
  config = true,
}
