return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<Leader>e", "<cmd> NvimTreeFindFile <CR>", desc = "open file tree", mode = "n" },
    { "<Leader>E", "<cmd> NvimTreeToggle <CR>",   desc = "Toggle file tree", mode = "n" },
  },
  cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
  end,
  lazy = true,
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', '<C-s>', api.node.run.system, opts('Run System'))
      vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', 'h', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', '<C-r>', api.tree.change_root_to_node, opts('change root'))
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
      vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
      vim.keymap.set('n', '<C-r>', api.node.run.cmd, opts('Run Command'))
      vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('root change up'))
      vim.keymap.set('n', '.', api.tree.change_root_to_node, opts('root change'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create File Or Directory'))
      vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts('Delete Bookmarked'))
      vim.keymap.set('n', 'bt', api.marks.bulk.trash, opts('Trash Bookmarked'))
      vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
      vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle Filter: No Buffer'))
      vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
      vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Filter: Git Clean'))
      vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
      vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
      vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
      vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
      vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
      vim.keymap.set('n', 'F', api.live_filter.clear, opts('Live Filter: Clear'))
      vim.keymap.set('n', 'f', api.live_filter.start, opts('Live Filter: Start'))
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      vim.keymap.set('n', 'ge', api.fs.copy.basename, opts('Copy Basename'))
      vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
      vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
      vim.keymap.set('n', 'L', api.node.open.toggle_group_empty, opts('Toggle Group Empty'))
      vim.keymap.set('n', 'M', api.tree.toggle_no_bookmark_filter, opts('Toggle Filter: No Bookmark'))
      vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
      vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
      vim.keymap.set('n', 'u', api.fs.rename_full, opts('Rename: Full Path'))
      vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Filter: Hidden'))
      vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
      vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
    end
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        git_ignored = false,
        dotfiles = false,
      },
      on_attach = my_on_attach,
    })
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.cmd("highlight def link NvimTreeOpenedFolderName NvimTreeOpenedFile")
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cond = function()
    return vim.g.vscode == nil
  end,
}
