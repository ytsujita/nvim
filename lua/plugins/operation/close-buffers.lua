local mappings = {
  n = {
    ["<leader>x"] = {
      function()
        require("close_buffers").delete({ type = "this" })
      end,
      "現在のバッファを削除",
    },
    ["<leader>X"] = {
      function()
        require("close_buffers").wipe({ type = "all" })
      end,
      "バッファを全て削除",
    },
  },
}

return {
  "kazhala/close-buffers.nvim",
  key = { "<leader>x", "<leader>X" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("close_buffers").setup()
  end,
}
