-- gitのconflictを見やすく
return {
  "akinsho/git-conflict.nvim",
  version = "v2.0.0",
  keys = { "<A-g>" },
  lazy = true,
  config = function()
    require('git-conflict').setup()
  end
}
