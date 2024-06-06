-- Flutterのコマンドバインディング
local mappings = {
  n = {
    ["<Leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
      "LSP rename"
    },
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<Leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<Leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    -- ["<Leader>c"] = {
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   "LSP code action",
    -- },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<Leader>fl"] = {
      function()
        vim.diagnostic.open_float({ border = "rounded" })
      end,
      "Floating diagnostic",
    },

    ["<Leader>fj"] = {
      function()
        vim.diagnostic.goto_next({ float = { border = "rounded" } })
      end,
      "Goto prev",
    },

    ["<Leader>fk"] = {
      function()
        vim.diagnostic.goto_prev({ float = { border = "rounded" } })
      end,
      "Goto next",
    },

    ["<Leader>Q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<Leader>woa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<Leader>wor"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<Leader>wol"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    ["<Leader>FF"] = {
      function()
        vim.lsp.buf.format()
      end,
      "format",
    }
  },
}

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
  cond = function()
    return vim.g.vscode == nil
  end,
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
      require("core.utils").load_mappings(mappings, { buffer = bufnr })
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
  lazy = true,
}
