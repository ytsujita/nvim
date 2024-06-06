return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  lazy = true,
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("ibl").setup({
      enabled = true,
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "",
        },
        buftypes = { "terminal" },
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        show_start = false,
      },
    })
  end,
}
