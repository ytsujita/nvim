-- icon component
return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  dependencies = {
    "DaikyXendo/nvim-material-icon",
  },
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
        dir = {
          icon = "",
          color = "#428850",
          name = "Dir",
        },
      },
      color_icons = true,
      default = true,
      strict = true,
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
      },
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log",
        },
      },
    })
  end,
  cond = function()
    return vim.g.vscode == nil
  end,
}
