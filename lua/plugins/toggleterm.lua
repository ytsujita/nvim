-- ターミナルを使いやすくする
local mappings = {
  n = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
  },
  i = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
  },
  t = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
  },
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = true,
}
