-- 空白飛ばし上下移動
local mappings = {
  n = {
    ["<Leader>jj"] = { "<Plug>(edgemotion-j)", "空白を飛ばして下に移動" },
    ["<Leader>kk"] = { "<Plug>(edgemotion-k)", "空白を飛ばして上に移動" },
  },
  v = {
    ["<Leader>jj"] = { "<Plug>(edgemotion-j)", "空白を飛ばして下に移動" },
    ["<Leader>kk"] = { "<Plug>(edgemotion-k)", "空白を飛ばして上に移動" },
  },
}

return {
  "haya14busa/vim-edgemotion",
  -- keys = { "<Leader>jj", "<Leader>kk" },
  event = "CursorMoved",
  init = function()
    require("core.utils").load_mappings(mappings)
  end,
}
