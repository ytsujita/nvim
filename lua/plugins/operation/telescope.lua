-- 色々検索ツール

local mappings = {
  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "ファイル検索" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "全検索" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "単語検査" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "バッファ検索" },
    ["<leader>fe"] = { "<cmd> Telescope file_browser <CR>", "ファイルブラウザ" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "ヘルプページ検索" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "oldファイル検索" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "現在のバッファ内検索" },
    -- git
    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "Git commits list" },
    ["<leader>fgt"] = { "<cmd> Telescope git_status <CR>", "Git status list" },
    ["<leader>fgy"] = { "<cmd> Telescope git_branches <CR>", "Git branches list" },
    -- colorscheme
    ["<leader>co"] = { "<cmd> Telescope colorscheme <CR>", "themes検索" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "ブクマ検索" },
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
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
          },
          i = {
            ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
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
        ["live_grep_args"] = {
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
      },
    }
    local telescope = require("telescope")
    telescope.setup(options)
    telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")
    telescope.load_extension("live_grep_args")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
}
