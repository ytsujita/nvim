local mappings = {
  n = {
    ["<Leader>dd"] = {
      function()
        require("dapui").toggle()
      end,
      "launch dap ui",
    }
  }
}

return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  keys = {
    { "<Leader>dd", mode = "n", desc = "launch dap UI" },
  },
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    require("dapui").setup({
      icons = { expanded = "", collapsed = "" },
      layouts = {
        {
          elements = {
            { id = "watches",     size = 0.20 },
            { id = "stacks",      size = 0.20 },
            { id = "breakpoints", size = 0.20 },
            { id = "scopes",      size = 0.40 },
          },
          size = 64,
          position = "right",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 0.20,
          position = "bottom",
        },
      },
    })
    require("core.utils").load_mappings(mappings)
  end
}
