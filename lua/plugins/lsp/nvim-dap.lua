local mappings = {
  n = {
    ["<F5>"] = { ":DapContinue<CR>", "デバッグ実行" },
    ["<F10>"] = { ":DapStepOver<CR>", "" },
    ["<F11>"] = { ":DapStepInto<CR>", "" },
    ["<F12>"] = { ":DapStepOut<CR>", "" },
    ["<Leader>dB"] = { ":DapToggleBreakpoint<CR>", "" },
    ["<Leader>dlp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      "ブレークポイントセット",
    },
    ["<Leader>dr"] = {
      function()
        require("dap").repl.open()
      end,
      "repl.open",
    },
    ["<Leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "run_last",
    },
  },
}

return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F5>",        mode = "n", desc = "Continue" },
    { "<F10>",       mode = "n", desc = "StepOver" },
    { "<F11>",       mode = "n", desc = "StepInto" },
    { "<F12>",       mode = "n", desc = "StepOut" },
    { "<Leader>dB",  mode = "n", desc = "ToggleBreakpoint" },
    { "<Leader>dlp", mode = "n", desc = "Set breakpoint" },
    { "<Leader>dr",  mode = "n", desc = "repl.open" },
    { "<Leader>dl",  mode = "n", desc = "run_last" },
  },
  cond = function()
    return vim.g.vscode == nil
  end,
  lazy = true,
  config = function()
    require("core.utils").load_mappings(mappings)
  end
}
