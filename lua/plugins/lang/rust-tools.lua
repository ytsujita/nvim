-- Rust開発環境用
return {
  "simrat39/rust-tools.nvim",
  ft = { "rust" },
  config = function()
    require("rust-tools").setup({
      tools = {
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
      },
      server = {
        on_attach = function(_, buf)
          vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = buf })
        end,
      },
    })
  end,
  lazy = true,
}
