---@diagnostic disable: missing-fields
local ok1, cmp = pcall(require, "cmp")
if not ok1 then
  return vim.notify("plugin not installed: cmp", vim.log.levels.ERROR)
end

local ok3, lspkind = pcall(require, "lspkind")
if not ok3 then
  return vim.notify("plugin not installed: lspkind", vim.log.levels.ERROR)
end

local ok2, luasnip = pcall(require, "luasnip")
if not ok2 then
  return vim.notify("plugin not installed: lspsnip", vim.log.levels.ERROR)
end

luasnip.filetype_extend("dart", { "flutter" })

local ts_utils = require "nvim-treesitter.ts_utils"
local icons = require "user.icons"

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip/loaders/from_vscode").lazy_load { paths = "~/.local/share/nvim/vim-snippets/snippets" }

vim.opt.completeopt = "menu,menuone,noselect"

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
    ["<C-Space>"] = cmp.mapping.complete(), -- autocomple suggestion popupmenu toggle
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
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
      mode = "symbol_text", -- show only symbol annotations -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
      maxwidth = 70, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      before = function(entry, vim_item)
        local maxwidth = 70
        local source = entry.source.name --> nvim_lsp, nvim_lua, luasnip, buffer, path
        local kind = vim_item.kind --> Class, Method, Variable etc...
        -- local item = entry:get_completion_item()
        vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
        vim_item.kind = icons.kind[kind] or "?"
        vim_item.menu = " [" .. kind .. "] "

        if source == "luasnip" or source == "nvim_lsp" then
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
  },

  -- sources for autocompletion, priorties from top to bottom order
  -- tutorial: https://www.youtube.com/watch?v=yTk3C3JMKzQ&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=40
  sources = cmp.config.sources {
    {
      name = "nvim_lsp", -- completions from lsp
      trigger_characters = { "." },
      keyword_length = 0,
      entry_filter = function(entry, _)
        local kind = entry:get_kind()
        local node = ts_utils.get_node_at_cursor():type()
        if node == "arguments" then
          if kind == 6 then
            return true
          else
            return false
          end
        end
        return true
      end,
    },
    { name = "luasnip" }, -- snippets completions
    { name = "codeium" }, -- completions from codeium
    -- { name = "cmp_tabnine" }, -- completions from tabnine ai
    { name = "buffer" }, -- completions from opened buffers
    { name = "path" }, -- filesystem path completions
    { name = "async_path" }, -- filesystem path completions
    {
      name = "tmux", -- completions from tmux sessions
      option = {
        all_panes = true,
        label = "[TMUX]",
        trigger_characters = { "?" },
        trigger_characters_ft = {},
        keyword_pattern = [[\w\+]],
        capture_history = false,
      },
    },
    { name = "emoji", option = { trigger_characters = { ":" } } },
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
      winhighlight = "Normal:LineNr,FloatBorder:LineNr,CursorLine:CurSearch,Search:None",
    },

    documentation = cmp.config.window.bordered {
      side_padding = 0,
      col_offset = 0,
      border = "double",
      -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
      winhighlight = "Normal:LineNr,FloatBorder:LineNr,CursorLine:CurSearch,Search:None",
    },
  },

  experimental = {
    ghost_text = true,
  },
}
