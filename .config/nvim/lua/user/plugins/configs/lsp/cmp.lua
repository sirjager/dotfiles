---@diagnostic disable: missing-fields
local ok1, cmp = pcall(require, "cmp")
if not ok1 then
  return
end

local ok2, luasnip = pcall(require, "luasnip")
if not ok2 then
  return
end

local ok3, lspkind = pcall(require, "lspkind")
if not ok3 then
  return
end

luasnip.filetype_extend("dart", { "flutter" })

local icons = require "user.icons"

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_vscode").lazy_load({ paths = "~/.local/share/nvim/vim-snippets/snippets" })
vim.opt.completeopt = "menu,menuone,noselect"

---@diagnostic disable-next-line: unused-local
local lsp_kind_order = {
  5,  -- Field
  10, -- Property
  2,  -- Method
  3,  -- Function
  4,  -- Constructor
  6,  -- Variable
  7,  -- Class
  8,  -- Interface
  9,  -- Module
  11, -- Unit
  12, -- Value
  13, -- Enum
  14, -- Keyword
  15, -- Snippet
  16, -- Color
  17, -- File
  18, -- Reference
  19, -- Folder
  20, -- EnumMember
  21, -- Constant
  22, -- Struct
  23, -- Event
  24, -- Operator
  25, -- TypeParameter
  1,  -- Text
}

--[[ -- custom Colors: not working]]
--[[ vim.api.nvim_set_hl(0, "MyNormal", { bg = "Black", fg = "White" }) ]]
--[[ vim.api.nvim_set_hl(0, "MyFloatBorder", { bg = "#A084E8", fg = "White" }) ]]
--[[ vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "Black", fg = "White" }) ]]

--[[ vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" }) ]]
--[[ vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" }) ]]
--[[ vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" }) ]]
--[[ vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" }) ]]

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()), -- autocomple suggestion popupmenu toggle
    ["<C-y>"] = cmp.config.disable,                      -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },

    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  formatting = {
    expandable_indicator = true,
    fields = { "kind", "abbr", "menu" }, -- rearrange positions if needed
    format = lspkind.cmp_format {
      mode = "symbol_text",              -- show only symbol annotations -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      maxwidth = 50,                     -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...",             -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      before = function(entry, vim_item)
        local source = entry.source.name

        local maxwidth = 80
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)

        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({

          nvim_lsp = "[LSP]",
          buffer = "[BUF]",
          codeium = "[CODIUM]",
          nvim_lua = "[LUA]",
          luasnip = "[SNIP]",
          cmp_tabnine = "[TAB9]",
          path = "[PATH]",
          tmux = "[TMUX]",
          crates = "[CRATE]",
          emoji = "[EMOJI]",
          calc = "[CALC]",
          look = "[DICT]",

          --
        })[entry.source.name]

        if source == "luasnip" then
          vim_item.dup = 0
        end


        if entry.source.name == "codeium" then
          vim_item.kind = icons.misc.Wand
        end

        if entry.source.name == "Codeium" then
          vim_item.kind = icons.misc.Wand
        end

        if entry.source.name == "copilot" then
          vim_item.kind = icons.git.Octoface
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end

        if source == "cmp_tabnine" then
          vim_item.dup = 0
          vim_item.kind = icons.misc.Robot
        end

        if entry.source.name == "crates" then
          vim_item.kind = icons.misc.Package
          vim_item.kind_hl_group = "CmpItemKindCrate"
        end

        if entry.source.name == "lab.quick_data" then
          vim_item.kind = icons.misc.CircuitBoard
          vim_item.kind_hl_group = "CmpItemKindConstant"
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        return vim_item
      end,
    },

    --
  },

  sorting = {
    --[[ comparators = { ]]
    --[[ 	compare.exact, ]]
    --[[ 	compare.kind, ]]
    --[[ 	compare.score, ]]
    --[[ 	compare.length, ]]
    --[[ 	function(entry1, entry2) ]]
    --[[ 		local kind1 = lsp_kind_order[entry1:get_kind()] ]]
    --[[ 		local kind2 = lsp_kind_order[entry2:get_kind()] ]]
    --[[ 		if kind1 < kind2 then ]]
    --[[ 			return true ]]
    --[[ 		end ]]
    --[[ 	end, ]]
    --[[ }, ]]
  },

  -- sources for autocompletion, priorties from top to bottom order
  sources = cmp.config.sources {
    {
      name = "nvim_lsp", -- completions from lsp

      -- tutorial: https://www.youtube.com/watch?v=yTk3C3JMKzQ&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=40
      ---@diagnostic disable-next-line: unused-local
      entry_filter = function(entry, context)
        local kind = entry:get_kind()
        --[[ -- with treesitter ]]
        --[[ local node = ts_utils.get_node_at_cursor():type() ]]
        --[[ if node == "arguments" then ]]
        --[[ 	if kind == 6 then ]]
        --[[ 		return true ]]
        --[[ 	else ]]
        --[[ 		return false ]]
        --[[ 	end ]]
        --[[ end ]]

        -- -- without treesitter
        local line = context.cursor_line
        local col = context.cursor.col
        local char_before_cursor = string.sub(line, col - 1, col - 1)
        if char_before_cursor == "." then
          if kind == 2 or kind == 5 then
            return true
          else
            return false
          end
        elseif string.match(line, "^%s*%w*$") then
          if kind == 2 or kind == 5 then
            return true
          else
            return false
          end
        end

        return true
      end,
    },

    { name = "luasnip" },     -- snippets completions
    { name = "codeium" },     -- completions from codeium
    { name = "cmp_tabnine" }, -- completions from tabnine ai
    { name = "buffer" },      -- completions from opened buffers
    -- { name = "path" },        -- filesystem path completions
    { name = "async_path" },  -- filesystem path completions
    {
      name = "tmux", -- completions from tmux sessions
      option = {
        all_panes = true,
        label = "[TMUX]",
        trigger_characters = { "." },
        trigger_characters_ft = {},
        keyword_pattern = [[\w\+]],
        capture_history = false,
      },
    },
    -- { name = "cmdline" },
    {
      name = "look",
      keyword_length = 3,
      option = {
        convert_case = true,
        loud = true,
        --dict = '/usr/share/dict/words'
      },
    },
    { name = "crates" }, -- rust crates completions and hints
    { name = "emoji" },
    { name = "calc" },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  window = {
    completion = cmp.config.window.bordered {
      side_padding = 0,
      col_offset = 0,
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:CurSearch,Search:None",
    },

    documentation = cmp.config.window.bordered {
      side_padding = 0,
      col_offset = 0,
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:CurSearch,Search:None",
    },
  },

  experimental = {
    ghost_text = true,
  },
}
