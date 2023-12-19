-- bufferを画面上部に表示
local mappings = {
  n = {
    ["<s-Tab>"] = { "<cmd>BufferLineCyclePrev<CR>", "前バッファへ" },
    ["<Tab>"] = { "<cmd>BufferLineCycleNext<CR>", "次バッファへ" },
    ["<Leader>>"] = { "<cmd>BufferLineMoveNext<CR>", "バッファを右に移動" },
    ["<Leader><"] = { "<cmd>BufferLineMovePrev<CR>", "バッファを左に移動" },
    ["<Leader>b"] = { "<cmd>BufferLinePick<CR>", "バッファ選択" },
  },
}

return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "BufAdd",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.opt.termguicolors = true
  end,
  config = function()
    require("core.utils").load_mappings(mappings)
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
