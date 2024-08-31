local M = {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = "BufReadPost",
  dependencies = {
    { "hrsh7th/cmp-path", event = "InsertEnter", lazy = true },
    { "hrsh7th/cmp-buffer", event = "InsertEnter", lazy = true },
    -- { "FelipeLema/cmp-async-path", event = "InsertEnter" },
    { "hrsh7th/cmp-buffer", event = "InsertEnter", lazy = true },
    { "hrsh7th/cmp-nvim-lua", event = "InsertEnter", lazy = true },
    { "hrsh7th/cmp-cmdline", event = "CmdlineEnter", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter", lazy = true },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter", lazy = true },
    { "andersevenrud/cmp-tmux", event = "InsertEnter", lazy = true },
    { "hrsh7th/cmp-emoji", event = "InsertEnter", lazy = true },
    { "hrsh7th/vim-vsnip", event = "InsertEnter", lazy = true },
    { "hrsh7th/vim-vsnip-integ", event = "InsertEnter", lazy = true },
    { "L3MON4D3/LuaSnip", event = "InsertEnter", lazy = true },
    { "rafamadriz/friendly-snippets", lazy = true },
    { "onsails/lspkind-nvim", lazy = true },
    { "hrsh7th/cmp-nvim-lua", lazy = true },
    { "roobert/tailwindcss-colorizer-cmp.nvim", lazy = true },
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local lspkind = require "lspkind"
  local icons = require "dope.icons"

  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip/loaders/from_vscode").lazy_load { paths = "~/.local/share/nvim/vim-snippets/snippets" }
  require("tailwindcss-colorizer-cmp").setup { color_square_width = 2 }

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  vim.filetype.add { extension = { astro = "astro" } }

  -- NOTE: Highlight Groups
  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
  vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })
  vim.api.nvim_set_hl(0, "CmpItemKindTabNine", { fg = "#6CC644" })
  vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", { fg = "#6CC644" })

  vim.opt.completeopt = "menu,menuone,noselect"

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
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<CR>"] = cmp.mapping.confirm { select = false },
      ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },

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
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        before = function(entry, vim_item)
          local maxwidth = 50
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
            vim_item.kind = icons.misc.Copilot
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "supermaven" then
            vim_item.kind = icons.misc.Supermaven
            vim_item.kind_hl_group = "CmpItemKindSupermaven"
          end

          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = icons.misc.Robot
            vim_item.kind_hl_group = "CmpItemKindTabnine"
          end

          if entry.source.name == "copilot" then
            vim_item.kind = icons.mics.Copilot
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if source == "cmp_tabnine" then
            vim_item.dup = 0
            vim_item.kind = icons.misc.Robot
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
        name = "nvim_lsp",
        trigger_characters = { "." },
        keyword_length = 0,
      },
      { name = "luasnip" }, -- snippets completions
      { name = "codeium" }, -- completions from codeium
      { name = "supermaven" }, -- another ai completions
      -- { name = "cmp_tabnine" }, -- completions from tabnine ai
      { name = "buffer" }, -- completions from opened buffers
      { name = "nvim_lua" },
      { name = "path" }, -- filesystem path completions
      -- { name = "async_path" }, -- filesystem path completions
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
    completion = {
      keyword_length = 1,
      completeopt = "menu,menuone,noinsert,noselect",
    },
    confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = true },
    preselect = true and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    window = {
      completion = cmp.config.window.bordered {
        side_padding = 1,
        col_offset = 0,
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
        border = {
          { "󱐋", "WarningMsg" },
          { "─", "Comment" },
          { "╮", "Comment" },
          { "│", "Comment" },
          { "╯", "Comment" },
          { "─", "Comment" },
          { "╰", "Comment" },
          { "│", "Comment" },
        },
      },

      documentation = cmp.config.window.bordered {
        side_padding = 1,
        col_offset = 1,
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
        border = {
          { "", "DiagnosticHint" },
          { "─", "Comment" },
          { "╮", "Comment" },
          { "│", "Comment" },
          { "╯", "Comment" },
          { "─", "Comment" },
          { "╰", "Comment" },
          { "│", "Comment" },
        },
      },
    },
    experimental = {
      ghost_text = false,
    },
  }

  -- require("cmp").config.formatting = { format = require("tailwindcss-colorizer-cmp").formatter }
end

return M
