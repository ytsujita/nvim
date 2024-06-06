return {
  "kat0h/bufpreview.vim",
  cmd = { "PreviewMarkdown", "PreviewMarkdownStop", "PreviewMarkdownToggle" },
  dependencies = {
    "vim-denops/denops.vim",
  },
  build = "deno task prepare",
  lazy = true,
}
