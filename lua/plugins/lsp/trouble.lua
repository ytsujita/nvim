-- コードの問題点を一覧で表示
local mappings = {
  n = {
    ["<C-t>"] = { "<cmd> TroubleToggle <CR>", "問題一覧ウィンドウを開く" },
  },
}

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
}
