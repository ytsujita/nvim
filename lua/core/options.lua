local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local sep = is_windows and "\\" or "/"
local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.mapleader = " "
g.plugin_cache_dir = vim.fn.stdpath("data") .. sep .. "lazy"
-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.editorconfig = true
-- g.directory = vim.fn.stdpath("data")
opt.cmdheight = 0

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
-- opt.pumblend = 0
-- opt.winblend = 0

opt.list = true
opt.listchars = "tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%"

-- gitsignsが使用するスワップファイルをディスクに書き込むための間隔
opt.updatetime = 250

-- 一部のデフォルトプロバイダーを無効にします
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- 使用するターミナルをcmdではなくpowershelに変更する
local powershell_options = {
  shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
  shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-- pythonのパスを設定する、pyenvによってglobal設定されているpythonを使用する
local result = vim.fn.system("pyenv which python")
local function cr_lines(s)
  return s:gsub("\r\n?", "\n"):gmatch("(.-)\n")
end
g.python3_host_prog = cr_lines(result)()

-- ターミナルを開いたときにインサートモードで開始する
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  command = "startinsert",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = { "*" },
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_user_command("OpenVimrc", "<cmd>e ~/.config/nvim/init.lua", {})
--
-- ripgrepが実行できるならrgコマンドを使わせる
if vim.fn.executable('rg') == 1 then
  vim.o.grepprg = "rg --vimgrep --hidden --glob ‘!.git’"
end
