-- 空白飛ばし上下移動
local mappings = {
  n = {
    ["<leader>J"] = { "<Plug>(edgemotion-j)", "空白を飛ばして下に移動" },
    ["<leader>K"] = { "<Plug>(edgemotion-k)", "空白を飛ばして上に移動" },
  },
  v = {
    ["<leader>J"] = { "<Plug>(edgemotion-j)", "空白を飛ばして下に移動" },
    ["<leader>K"] = { "<Plug>(edgemotion-k)", "空白を飛ばして上に移動" },
  },
}

return {
  "haya14busa/vim-edgemotion",
  event = "CursorMoved",
  keys = { "<leader>J", "<leader>K" }, -- FIXME: なぜか効かない、要修正
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
}
