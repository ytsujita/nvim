-- 下に各種情報表示
local lsp_names = function()
  local clients = {}
  for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    table.insert(clients, client.name)
  end
  return " " .. table.concat(clients, ", ")
end


return {
  "nvim-lualine/lualine.nvim",
  event = "CursorMoved",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "SmiteshP/nvim-navic",
  },
  config = function()
    local navic = require("nvim-navic")
    require("lualine").setup({
      options = {
        theme = "auto",
        disabled_filetypes = {
          statusline = { "packer", "NvimTree" },
          winbar = { "packer", "NvimTree" },
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_x = { lsp_names },
        lualine_y = { "fileformat", "filetype" },
        lualine_z = { "progress", "location" },
      },
      winbar = {
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
        lualine_y = { "encoding" },
      },
    })
  end,
}
