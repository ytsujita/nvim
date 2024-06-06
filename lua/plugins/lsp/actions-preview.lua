-- code action
return {
  "aznhe21/actions-preview.nvim",
  keys = {
    { "<Leader>ca", mode = "n", desc = "Action Preview" },
  },
  config = function()
    vim.keymap.set({ "n" }, "<Leader>ca", require("actions-preview").code_actions)
    require("actions-preview").setup {
      diff = {
        ctxlen = 3,
      },
      highlight_command = {
      },
      backend = { "nui" },
      nui = {
        dir = "col",
        keymap = nil,
        layout = {
          position = "50%",
          size = {
            width = "60%",
            height = "90%",
          },
          min_width = 40,
          min_height = 10,
          relative = "editor",
        },
        preview = {
          size = "60%",
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
        select = {
          size = "40%",
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
        },
      },
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim"
  },
  lazy = true,
}
