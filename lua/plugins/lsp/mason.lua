-- LSPなどをインストールする手間を省く
return {
  "williamboman/mason.nvim",
  cmd = { "Mason" },
  init = function()
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    local sep = is_windows and "\\" or "/"
    vim.env.PATH = vim.fn.stdpath("data") ..
        sep .. "mason" .. sep .. "bin" .. (is_windows and ";" or ":") .. vim.env.PATH
  end,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
  end
}
