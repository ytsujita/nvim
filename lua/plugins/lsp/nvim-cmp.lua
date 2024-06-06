-- 補完
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  lazy = true,
  cond = function()
    return vim.g.vscode == nil
  end,
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      tag = "v2.3.0",
      config = function()
        local ls = require("luasnip")
        ls.setup({
          history = true,
          update_events = "TextChanged, TextChangedI",
        })
      end
    },
    { -- 括弧を書いたら閉じ括弧も自動挿入する (){}[] etc
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)

        -- setup cmp for autopairs
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
    { -- 補完するときのソース
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local function border(hl_name)
      return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
      }
    end

    require('luasnip.loaders.from_vscode').lazy_load({ paths = { "~/.config/nvim/my_snippets" } })

    local ls = require("luasnip")
    local s = ls.snippet
    local f = ls.function_node
    local t = ls.text_node

    -- .git ディレクトリを見つけるための関数
    local function find_git_root()
      local current_dir = vim.fn.expand('%:p:h')

      while current_dir ~= "/" do
        if vim.fn.isdirectory(current_dir .. "/.git") == 1 then
          return current_dir
        end
        current_dir = vim.fn.fnamemodify(current_dir, ":h")
      end

      return nil
    end

    local function insert_generated(path)
      -- パスをスラッシュで分割
      local parts = {}
      for part in string.gmatch(path, "[^/]+") do
        table.insert(parts, part)
      end

      -- 最初と2番目の部分の間に_generatedを挿入
      local new_parts = {}
      for _ = 3, #parts do
        table.insert(new_parts, "..")
      end
      table.insert(new_parts, "_generated")
      for i = 2, #parts do
        table.insert(new_parts, parts[i])
      end

      -- 分割された部分を再度結合して元の形式に戻す
      local new_path = table.concat(new_parts, '/')
      return new_path
    end

    local function transform_path()
      local current_path = vim.api.nvim_buf_get_name(0)
      local git_root = find_git_root()

      if not git_root then
        return current_path -- .git フォルダが見つからない場合はそのまま
      end

      local dir = vim.fn.expand("%:r")
      local replaced_dir = string.gsub(dir, "\\", "/")
      return insert_generated(replaced_dir)
    end

    local function to_pascal_case(str)
      -- 文字列をスラッシュで分割
      local parts = {}
      for part in string.gmatch(str, "[^_]+") do
        table.insert(parts, part)
      end

      -- 各部分をキャピタライズして結合
      for i, part in ipairs(parts) do
        parts[i] = part:sub(1, 1):upper() .. part:sub(2):lower()
      end

      return table.concat(parts)
    end

    ls.add_snippets("dart", {
      s("frz", {
        t({
          "import 'package:freezed_annotation/freezed_annotation.dart';",
          "import 'package:flutter/foundation.dart';",
          "",
        }),
        f(function()
          return "part '" .. transform_path() .. ".freezed.dart';"
        end, {}),
        t({ "", "" }),
        f(function()
          return "part '" .. transform_path() .. ".g.dart" .. "';"
        end, {}),
        t({ "", "", "@freezed", "" }),
        f(function()
          local class_name = to_pascal_case(vim.fn.expand("%:t:r"))
          return "class " .. class_name .. " with _$" .. class_name .. "{"
        end, {}),
        t({ "", "" }),
        f(function()
          local class_name = to_pascal_case(vim.fn.expand("%:t:r"))
          return "\tconst factory " .. class_name .. "({"
        end, {}),
        t({ "", "\t\trequired String id,", "" }),
        f(function()
          local class_name = to_pascal_case(vim.fn.expand("%:t:r"))
          return "\t}) = _$" .. class_name .. ";"
        end, {}),
        t({ "", "" }),
        f(function()
          local class_name = to_pascal_case(vim.fn.expand("%:t:r"))
          return "\tfactory " ..
              class_name .. ".fromJson(Map<String, dynamic> json) => _$" .. class_name .. "FromJson(json);\\n\\n\\n"
        end, {}),
        t({ "", "}", "" })
      }),
    })

    local lspkind = require("lspkind")
    local options = {
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text', -- show only symbol annotations
          maxwidth = 50,        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(_, vim_item)
            return vim_item
          end
        }),
      },
      completion = {
        completeopt = "menu,menuone",
      },
      window = {
        -- completion = {
        -- side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
        -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
        -- scrollbar = false,
        -- },
        documentation = {
          border = border("CmpDocBorder"),
          -- winhighlight = "Normal:CmpDoc",
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- https://github.com/neovim/neovim/issues/19575
        -- Add windows terminal settings key.
        -- {
        --     "keys": "ctrl+space",
        --     "command": {
        --         "action": "sendInput",
        --         "input": "\u001b[32;5u"
        --     }
        -- }
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end,
          { "i", "s" }
        )
      },
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp", max_item_count = 30 },
        { name = "path" },
        { name = "buffer" },
        { name = "cmdline",  option = { ignore_cmds = { "Man", "!" } } },
      },
      sorting = {
        -- comparators = {
        --   cmp.offset,
        --   cmp.exact,
        --   cmp.score,
        --   cmp.recently_used,
        --   cmp.locality,
        --   cmp.kind,
        --   cmp.sort_text,
        --   cmp.length,
        --   cmp.order,
        -- },
      },
    }
    require("cmp").setup(options)
  end,
}
