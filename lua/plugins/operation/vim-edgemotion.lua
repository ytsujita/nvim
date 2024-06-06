-- 空白飛ばし上下移動

return {
  "haya14busa/vim-edgemotion",
  keys = {
    { "<Leader>jj", "<Plug>(edgemotion-j)", desc = "jump edge down", mode = { "n", "v" } },
    { "<Leader>kk", "<Plug>(edgemotion-k)", desc = "jump edge down", mode = { "n", "v" } },
  },
  lazy = true,
}
