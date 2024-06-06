-- 加速jk
local mapping = {
  n = {
    ["j"] = {
      "<Plug>(accelerated_jk_j)",
      "j長押しで加速",
    },
    ["k"] = {
      "<Plug>(accelerated_jk_k)",
      "k長押しで加速",
    },
  },
}

return {
  "rhysd/accelerated-jk",
  event = "CursorMoved",
  config = function()
    require("core.utils").load_mappings(mapping, { silent = true })
  end,
  lazy = true,
}
