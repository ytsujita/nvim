-- fold by treesitter
return {
  "kevinhwang91/nvim-ufo",
  lazy = true,
  keys = {
    "zf",
    "zd",
    "zD",
    "zE",
    "zo",
    "zO",
    "zc",
    "zC",
    "za",
    "zA",
    "zv",
    "zx",
    "zX",
    "zm",
    "zM",
    "zr",
    "zR",
    "zn",
    "zN",
    "zi",
  },
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          relculright = true,
          segments = {
            { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
            { text = { "%s" },                  click = "v:lua.ScSa" },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
      end,
    },
  },
  init = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require("ufo").setup({
      provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
      end
    })
  end,
}
