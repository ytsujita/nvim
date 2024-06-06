local mappings = {
  n = {
    -- find symbol
    ["<Leader>fs"] = { "<cmd>Navbuddy<CR>", "find symbols" },
  },
}

return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  event = "LspAttach",
  opts = { lsp = { auto_attach = true } },
  config = function()
    require("core.utils").load_mappings(mappings)
  end
}
