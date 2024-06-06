return {
  "akinsho/bufferline.nvim",
  lazy = true,
  event = "BufAdd",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<s-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "前バッファへ", mode = "n" },
    { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "次バッファへ", mode = "n" },
    { "<Leader><", "<cmd>BufferLineMovePrev<CR>", desc = "バッファを左に移動", mode = "n" },
    { "<Leader>>", "<cmd>BufferLineMoveNext<CR>", desc = "バッファを右に移動", mode = "n" },
    { "<Leader>b", "<cmd>BufferLinePick<CR>", desc = "バッファ選択", mode = "n" },
  },
  init = function()
    vim.opt.termguicolors = true
  end,
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "NvimTree",
            text = "🌳 Nvim Tree 🌳",
            highlight = "Directory",
            text_align = "left",
          },
        },
        separator_style = "thick",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, _, _)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    })
  end,
}
