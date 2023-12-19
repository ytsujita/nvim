return {
  "aznhe21/actions-preview.nvim",
  config = function()
    -- find code action
    vim.keymap.set({ "v", "n" }, "<leader>fc", require("actions-preview").code_actions)
  end,
}
