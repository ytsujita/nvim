-- コメントアウトショートカット
local mappings = {
  n = {
    ["<Leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "コメントアウト着脱",
    },
  },
  v = {
    ["<Leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "コメントアウト着脱",
    },
  },
}

return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n",          desc = "Comment toggle current line" },
    { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n",          desc = "Comment toggle current block" },
    { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
  },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("Comment").setup({})
  end,
}
