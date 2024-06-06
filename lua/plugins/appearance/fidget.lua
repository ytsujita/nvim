-- LSPの通知を右下に小さく表示
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  config = function()
    require("fidget").setup()
  end,
}
