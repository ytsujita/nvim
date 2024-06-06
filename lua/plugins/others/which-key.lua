-- キーマップのヒント表示
local mappings = {
  n = {
    ["<Leader>wK"] = {
      function()
        vim.cmd("WhichKey")
      end,
      "Which-key all keymaps",
    },
    ["<Leader>wk"] = {
      function()
        local input = vim.fn.input("WhichKey: ")
        vim.cmd("WhichKey " .. input)
      end,
      "Which-key query lookup",
    },
  },
}

return {
  "folke/which-key.nvim",
  keys = { "<Leader>", '"', "'", "`", "c", "g", "z" },
  cond = function()
    return vim.g.vscode == nil
  end,
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("which-key").setup({})
  end,
  lazy = true,
}
