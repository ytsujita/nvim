local M = {}

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local sep = is_windows and "\\" or "/"

M.lazy_nvim = {
  root = vim.fn.stdpath("data") .. sep .. "vscode" .. sep .. "lazy",
  defaults = {
    lazy = true,
    version = nil,
    cond = nil,
  },
  spec = nil,
  lockfile = vim.fn.stdpath("config") .. sep .. "vscode" .. sep .. "lazy-lock.json",
  concurrency = jit.os:find("Windows") and (vim.loop.available_parallelism() * 2) or nil,
  git = {
    log = { "-8" },
    timeout = 120,
    url_format = "https://github.com/%s.git",
    filter = true,
  },
  dev = {
    path = "~/projects",
    patterns = {},
    fallback = false,
  },
  install = {
    missing = true,
    colorscheme = { "habamax" },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    wrap = true,
    border = "none",
    title = nil,
    title_pos = "center",
    pills = true,
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    browser = nil,
    throttle = 20,
    custom_keys = {},
  },
  diff = {
    cmd = "git",
  },
  checker = {
    enabled = false,
    concurrency = nil,
    notify = true,
    frequency = 3600,
  },
  change_detection = {
    enabled = true,
    notify = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {},
    },
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. sep .. "lazy" .. sep .. "readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. sep .. "lazy" .. sep .. "state.json",
  build = {
    warn_on_override = true,
  },
}

return M
