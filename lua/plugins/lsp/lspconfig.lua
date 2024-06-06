-- LSP設定集
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

    ["<Leader>lc"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

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
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  dependencies = {
    "folke/neoconf.nvim",
    "SmiteshP/nvim-navic",
    "SmiteshP/nvim-navbuddy",
  },
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  config = function()
    local navic = require("nvim-navic")
    local navbuddy = require("nvim-navbuddy")
    local border = {
      { "╭", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╮", "FloatBorder" },
      { "│", "FloatBorder" },
      { "╯", "FloatBorder" },
      { "─", "FloatBorder" },
      { "╰", "FloatBorder" },
      { "│", "FloatBorder" },
    }
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
        navbuddy.attach(client, bufnr)
      end
      require("core.utils").load_mappings(mappings, { buffer = bufnr })
    end

    -- INFO: dependencies efm-langserver
    -- scoop install go
    -- go install github.com/mattn/efm-langserver@latest

    require("lspconfig").efm.setup({
      on_attach = on_attach,
      handlers = handlers,
      init_options = {
        documentFormatting = true,
      },
      filetypes = {
        "lua",
        "python",
        "markdown",
      },
      settings = {
        rootMakers = { ".git/" },
        language = {
          lua = {
            { formatCommand = "lua-format -i", formatStdin = true },
          },
          python = {
            -- INFO:
            --  write the settings "%AppData%/efm-langserver/config.yaml" in Windows
            --  write the settings ".config/efm-langserver/config.yaml" for other envs
            -- INFO: poetry add ruff black mypy --dev
            {
              formatCommand = "ruff check --select I --fix --stdin-filename '${INPUT}'",
              formatStdin = true,
              rootMakers = {
                'pyproject.toml',
                'setup.py',
                'requirements.txt',
                'ruff.toml',
              }
            },
            {
              formatCommand = "ruff format --no-cache --stdin-filename '${INPUT}'",
              formatStdin = true,
              rootMakers = {
                'pyproject.toml',
                'setup.py',
                'requirements.txt',
                'ruff.toml',
              }
            },
            {
              lintCommand = 'ruff check --stdin-filename "${INPUT}"',
              lintSource = "efm/ruff",
              lintStdin = true,
              lintFormats = { '%.%#:%l:%c: %t%n %m' },
              lintSeverity = 4,
              rootMarkers = {
                'ruff.toml',
                'pyproject.toml',
                'setup.cfg',
              },
            },
            {
              lintCommand = "mypy --show-column-numbers --strict --strict-equality",
              lintFormats = { "%f:%l:%c: %t%*[^:]: %m" },
              lintSource = "mypy",
              lintStdin = true,
            },
          },
          markdown = {
            { -- INFO: scoop install pandoc
              formatCommand = "pandoc -f markdown+hard_line_breaks -t markdown_strict --tab-stop=2 --wrap=none",
              formatStdin = true,
            },
            {
              lintCommand = "markdownlint -s -c ~/.config/.markdownlintrc",
              lintStdin = true,
              lintFormats = {
                '%f:%l %m',
                '%f:%l:%c %m',
                '%f: %l: %m',
              },
            }
          },
        }
      },
    })

    require("lspconfig").ruff_lsp.setup {
      handlers = handlers,
      on_attach = on_attach,
      init_options = {
        settings = {
          args = {},
        }
      }
    }

    require("lspconfig").lua_ls.setup({
      on_attach = on_attach,
      handlers = handlers,
      settings = {
        Lua = {}
      }
    })

    require 'lspconfig'.terraformls.setup {
      on_attach = on_attach,
      handlers = handlers,
    }

    require("lspconfig").pyright.setup({
      handlers = handlers,
      settings = {
        pyright = {
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            ignore = { '*' },
            typeCheckingMode = "off",
          }
        }
      },
      on_attach = on_attach
    })

    require("lspconfig").typos_lsp.setup({})

    vim.api.nvim_create_autocmd(
      { "BufWritePre" },
      {
        callback = function()
          vim.lsp.buf.format()
        end
      }
    )
  end
}
