-- Flutterのコマンドバインディング
return {
  "akinsho/flutter-tools.nvim",
  ft = {
    "dart"
  },
  cmd = {
    "FlutterRun",
    "FlutterDevices",
    "FlutterEmulators",
    "FlutterReload",
    "FlutterRestart",
    "FlutterQuit",
    "FlutterDetach",
    "FlutterOutlineToggle",
    "FlutterOutlineOpen",
    "FlutterDevTools",
    "FlutterCopyProfilerUrl",
    "FlutterLspRestart",
    "FlutterSuper",
    "FlutterReanalyze",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "SmiteshP/nvim-navbuddy",
  },
  config = function()
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")
    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
      navbuddy.attach(client, bufnr)
    end

    require("flutter-tools").setup({
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      debugger = {
        enabled = true,
        run_via_dap = false,
      },
      dev_log = {
        enabled = true,
        open_cmd = "10sp",
      },
      lsp = {
        color = { enabled = true },
        on_attach = on_attach,
        settings = {
          showTodos = false,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
        },
      },
    })
  end,
}
