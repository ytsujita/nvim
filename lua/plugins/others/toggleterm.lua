-- ターミナル制御

function LazygitToggle()
  local Terminal = require("toggleterm.terminal").Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true,
    count = 10,
  })
  lazygit:toggle()
end

-- ターミナルを使いやすくする
local mappings = {
  n = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua LazygitToggle()<CR>", "lazygit" },
  },
  i = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-j>"] = { "<Esc><cmd>ToggleTerm direction=horizontal size=20<CR>", "画面下にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua LazygitToggle()<CR>", "lazygit" },
  },
  t = {
    ["<A-l>"] = { "<cmd>ToggleTerm direction=vertical size=90<CR>", "画面右にターミナルを開く" },
    ["<A-f>"] = { "<cmd>ToggleTerm direction=float size=80<CR>", "画面中央にターミナルを開く" },
    ["<A-i>"] = { "<Esc><cmd>ToggleTerm direction=float size=15<CR>", "画面中央にターミナルを開く" },
    ["<A-g>"] = { "<cmd>lua LazygitToggle()<CR>", "lazygit" },
  },
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cond = function()
    return vim.g.vscode == nil
  end,
  keys = { "<Leader>g" },
  cmd = { "ToggleTerm" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = true,
  lazy = true,
}
