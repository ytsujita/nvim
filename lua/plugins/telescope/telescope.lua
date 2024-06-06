-- 色々検索ツール
local mappings = {
  n = {
    ["<Leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<Leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "fild all" },
    ["<Leader>fw"] = { "<cmd> Telescope live_grep <CR>", "find word" },
    ["<Leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffer" },
    ["<Leader>fh"] = { "<cmd> Telescope help_tags <CR>", "find help page" },
    ["<Leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "find in current buffer" },
    ["<Leader>fm"] = { "<cmd> Telescope marks <CR>", "find marks" },
    ["<Leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "find diagnostics" },
    ["<Leader>fco"] = { "<cmd> Telescope colorscheme <CR>", "find colorscheme" },

    ["<Leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits list" },
    ["<Leader>fgt"] = { "<cmd> Telescope git_status <CR>", "Git status list" },
    ["<Leader>fgy"] = { "<cmd> Telescope git_branches <CR>", "Git branches list" },
  },
}

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    local options = {
      defaults = {
        prompt_prefix = "   ",
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["<c-t>"] = require("trouble.sources.telescope").open,
          },
          i = {
            ["<c-t>"] = require("trouble.sources.telescope").open,
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
        },
      },
      extensions = {
        ["themes"] = {},
        ["terms"] = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = false,
          mappings = {
            -- INFO: custom mappings.
          },
        },
        project = {
          base_dirs = {
            '~/.config/nvim',
          },
          hidden_files = false,
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true,
          on_project_selected = function(prompt_bufnr)
            local project_actions = require("telescope._extensions.project.actions")
            project_actions.change_working_directory(prompt_bufnr, false)
            require("harpoon.ui").nav_file(1)
          end
        }
      },
    }
    local telescope = require("telescope")
    telescope.setup(options)
    telescope.load_extension("ui-select")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  lazy = true,
}
