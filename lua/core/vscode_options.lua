local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local sep = is_windows and "\\" or "/"
local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.mapleader = " "
g.plugin_cache_dir = vim.fn.stdpath("data") .. sep .. "vscode" .. sep .. "lazy"
-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.editorconfig = true
-- g.directory = vim.fn.stdpath("data")

-------------------------------------- options ------------------------------------------
vim.wo.wrap = false
opt.autoread = true
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- デフォルトインデント
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- 行番号
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- 列位置ハイライト
opt.colorcolumn = "120"

-- NVIM intro を無効にします
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- gitsignsが使用するスワップファイルをディスクに書き込むための間隔
opt.updatetime = 250

opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"

-- 一部のデフォルトプロバイダーを無効にします
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- pythonのパスを設定する、pyenvによってglobal設定されているpythonを使用する
local result = vim.fn.system("pyenv which python")
local function cr_lines(s)
  return s:gsub("\r\n?", "\n"):gmatch("(.-)\n")
end
g.python3_host_prog = cr_lines(result)()

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank()
  end,
})

if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = "rg --vimgrep --hidden --glob ‘!.git’"
end
