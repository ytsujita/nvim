-- カーソル移動をどこでも一発で
local mappings = {
  n = {
    ["<Leader>jw"] = { "<cmd>HopWord<CR>", "単語区切りジャンプ" },
    ["<Leader>jv"] = { "<cmd>HopVertical<CR>", "縦列ジャンプ" },
  },
}

return {
  "phaazon/hop.nvim",
  branch = "v2",
  cmd = { "HopWord", "HopVertical" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("hop").setup({})
  end,
}
