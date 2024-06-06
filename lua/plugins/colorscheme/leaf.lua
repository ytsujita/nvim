return {
  "daschw/leaf.nvim",
  lazy = false,
  event = "BufReadPost",
  priority = 1000,
  config = function()
    require("leaf").setup({
      underlineStyle = "underline",
      commentStyle = "italic",
      functionStyle = "NONE",
      keywordStyle = "italic",
      statementStyle = "bold",
      typeStyle = "NONE",
      variablebuiltinStyle = "italic",
      transparent = true,
      colors = {},
      overrides = {},
      theme = "dark",      -- default, based on vim.o.background, alternatives: "light", "dark"
      contrast = "medium", -- default, alternatives: "medium", "high"
    })
    vim.cmd("colorscheme leaf")
  end,
}
