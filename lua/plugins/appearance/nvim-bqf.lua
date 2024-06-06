-- quickfix windows
return {
  "kevinhwang91/nvim-bqf",
  lazy = true,
  ft = { "qf" },
  config = function()
    require("bqf").setup()
  end,
}

