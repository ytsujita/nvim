-- f ジャンプで一回で飛べる位置を色づけ

if vim.g.vscode then
  vim.cmd([[ highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline ]])
  vim.cmd([[ highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline ]])
end


return {
  "unblevable/quick-scope",
  event = "CursorMoved",
}
