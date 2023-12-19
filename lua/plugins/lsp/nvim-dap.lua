local mappings = {
  n = {
    ["<F5>"] = { ":DapContinue<CR>", "デバッグ実行" },
    ["<F10>"] = { ":DapStepOver<CR>", "" },
    ["<F11>"] = { ":DapStepInto<CR>", "" },
    ["<F12>"] = { ":DapStepOut<CR>", "" },
    -- ["<leader>B"] = { ":DapToggleBreakpoint<CR>", "" },
    ["<leader>BB"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))
      end,
      "ブレークポイントセット",
    },
    ["<leader>lp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      "ブレークポイントセット",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "repl.open",
    },
    ["<leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "run_last",
    },
    -- ["<leader>dd"] = {
    --   function()
    --     require("dapui").toggle()
    --   end,
    --   "dap UIの起動",
    -- },
  },
}

return {
  "mfussenegger/nvim-dap",
  key = { "<F5>", "<F10>", "<F11>", "<F12>", "<leader>bb", "<leader>B", "<leader>lp", "<leader>dr", "<leader>dl" },
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
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
      end,
    },
  },
}

-- { -- python デバッグ
--   "mfussenegger/nvim-dap-python",
--   key = { "<F5>", "<F10>", "<F11>", "<F12>", "<leader>bb", "<leader>B", "<leader>lp", "<leader>dr", "<leader>dl" },
--   dependencies = {
--     "mfussenegger/nvim-dap",
--   },
--   config = function()
--     require("dap-python").setup("poetry run python")
--   end,
-- }
