local mappings = {
  n = {
    ["<Leader>x"] = {
      function()
        require('close_buffers').delete({ type = 'this' })
      end,
      "close current buffer",
    },
    ["<Leader>X"] = {
      function()
        require("close_buffers").wipe({ type = "all" })
      end,
      "close all buffers",
    },
  },
}

return {
  "kazhala/close-buffers.nvim",
  lazy = true,
  keys = {
    { "<Leader>x", mode = "n", desc = "close current buffer" },
    { "<leader>X", mode = "n", desc = "close all buffers" },
  },
  config = function()
    require("core.utils").load_mappings(mappings)
    require("close_buffers").setup({})
  end,
}
