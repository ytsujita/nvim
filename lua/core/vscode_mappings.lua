return {
  n = {
    ["<Leader>ww"] = {
      function()
        require("vscode-neovim").call("workbench.action.files.save")
      end,
      "save file",
    },
    ["<Leader>wa"] = {
      function()
        require("vscode-neovim").call("workbench.action.files.saveFiles")
      end,
      "save file",
    },
    ["<Leader>q"] = {
      function()
        require("vscode-neovim").call("workbench.action.closeActiveEditor")
      end,
      "close current buffer",
    },

    ["<Leader>fJ"] = {
      function()
        require("vscode-neovim").call("editor.action.marker.nextInFiles")
      end,
      "next lsp error",
    },
    ["<Leader>fK"] = {
      function()
        require("vscode-neovim").call("editor.action.marker.prevInFiles")
      end,
      "previous lsp error",
    },
    ["<Leader>fj"] = {
      function()
        require("vscode-neovim").call("editor.action.marker.next")
      end,
      "next lsp error",
    },
    ["<Leader>fk"] = {
      function()
        require("vscode-neovim").call("editor.action.marker.prev")
      end,
      "previous lsp error",
    },

    ["<Leader>_d"] = { '"_d', "ヤンクせずに削除" },
    ["<Leader>_c"] = { '"_c', "ヤンクせずに削除" },

    ["<Leader>fs"] = {
      function()
        require("vscode-neovim").call("workbench.action.gotoSymbol")
      end,
      "find symbol",
    },
    ["<Leader>ff"] = {
      function()
        require("vscode-neovim").call("workbench.action.quickOpen")
      end,
      "find files",
    },
    ["<Leader>ft"] = {
      function()
        require("vscode-neovim").call("workbench.actions.view.problems")
      end,
      "find trouble",
    },
    ["<Leader>fd"] = {
      function()
        require("vscode-neovim").call("workbench.debug.action.toggleRepl")
      end,
      "find debug log",
    },
    ["<Leader>fw"] = {
      function()
        require("vscode-neovim").call("workbench.view.search")
      end,
      "find word",
    },
    ["<Leader>e"] = {
      function()
        require("vscode-neovim").call("workbench.files.action.focusFilesExplorer")
      end,
      "open explorer",
    },
    ["<Leader>E"] = {
      function()
        require("vscode-neovim").call("workbench.action.toggleSidebarVisibility")
      end,
      "toggle explorer",
    },
    ["<Leader>x"] = {
      function()
        require("vscode-neovim").call("workbench.action.closeActiveEditor")
      end,
      "close current buffer",
    },
    ["<Leader>X"] = {
      function()
        require("vscode-neovim").call("workbench.action.closeAllEditors")
      end,
      "close all buffer"
    },

    ["ss"] = {
      function()
        require("vscode-neovim").call("workbench.action.splitEditorDown")
      end,
      "画面の上下分割",
    },
    ["sv"] = {
      function()
        require("vscode-neovim").call("workbench.action.splitEditorRight")
      end,
      "画面の左右分割",
    },
    ["sj"] = {
      function()
        require("vscode-neovim").call("workbench.action.focusBelowGroup")
      end,
      "下ウィンドウに移動",
    },
    ["sk"] = {
      function()
        require("vscode-neovim").call("workbench.action.focusAboveGroup")
      end,
      "上ウィンドウに移動",
    },
    ["sl"] = {
      function()
        require("vscode-neovim").call("workbench.action.focusRightGroup")
      end,
      "右ウィンドウに移動"
    },
    ["sh"] = {
      function()
        require("vscode-neovim").call("workbench.action.focusLeftGroup")
      end,
      "左ウィンドウに移動",
    },
    ["sn"] = {
      function()
        require("vscode-neovim").call("workbench.action.moveEditorToNextGroup")
      end,
      "次ウィンドウへ",
    },
    ["sp"] = {
      function()
        require("vscode-neovim").call("workbench.action.moveEditorToPreviousGroup")
      end,
      "前ウィンドウへ",
    },
    ["sL"] = {
      function()
        require("vscode-neovim").call("workbench.action.moveEditorToPreviousGroup")
      end,
      "ウィンドウを右へ",
    },
    ["sH"] = {
      function()
        require("vscode-neovim").call("workbench.action.moveEditorToNextGroup")
      end,
      "ウィンドウを左へ",
    },

    -- "editor.action.addCursorsToTop"

    ["<C-j>"] = { "+", "一行下に" },
    ["<C-k>"] = { "-", "一行上に" },
    ["zj"] = {
      ':call VSCodeExtensionNotify("reveal", "top", 0)<CR>',
      "カーソルを画面最上部に",
    },
    ["zk"] = {
      ':call VSCodeExtensionNotify("reveal", "bottom", 0)<CR>',
      "カーソルを画面最下部に",
    },
    ["+"] = { "<C-a>", "インクリメント" },
    ["-"] = { "<C-x>", "デクリメント" },
    ["<Leader>re"] = { ":%s;\\<<C-R><C-W>\\>;g<Left><Left>;", "置換" },
    ["<Leader>p"] = { '"0p', "paste 0 register" },
    ["<Leader><Leader>"] = { "<C-^>", "Toggle between previous file and current file." },
    ["<Leader>n"] = { ":cnext<CR>", "Next quickfix." },
    ["<Leader>N"] = { ":cprevious<CR>", "Next quickfix." },
    ["<Leader>gj"] = { "10j", "Next quickfix." },
    ["<Leader>gk"] = { "10k", "Next quickfix." },
  },
  v = {
    ["<Leader>p"] = { '"0p', "0レジスタをペースト" },
  },
}
