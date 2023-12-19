-- File Tree
local mappings = {
  n = {
    ["<leader>e"] = {
      "<cmd> NvimTreeFindFile <CR>",
      "ファイルツリーを開く",
    },
    ["<leader>E"] = {
      "<cmd> NvimTreeToggle <CR>",
      "ファイルツリーを開閉",
    },
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    require("core.utils").load_mappings(mappings)
  end,
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
