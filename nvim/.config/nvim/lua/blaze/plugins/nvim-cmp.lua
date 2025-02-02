local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-path", event = "InsertEnter" },
    --
    { "hrsh7th/cmp-buffer", event = "InsertEnter" },
    { "andersevenrud/cmp-tmux", event = "InsertEnter" },
    --
    { "hrsh7th/cmp-nvim-lua", event = "InsertEnter" },
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
    --
    { "onsails/lspkind-nvim" },
    { "roobert/tailwindcss-colorizer-cmp.nvim" },
    --
    { "mlaursen/vim-react-snippets" },
    { "rafamadriz/friendly-snippets" },
    { "hrsh7th/vim-vsnip", event = "InsertEnter" },
    { "hrsh7th/vim-vsnip-integ", event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
  },
}

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local lspkind = require "lspkind"
  local icons = require "blaze.icons"

  require("vim-react-snippets").lazy_load()
  require("luasnip.loaders.from_lua").load()
  require("luasnip/loaders/from_vscode").lazy_load()
  require("tailwindcss-colorizer-cmp").setup { color_square_width = 2 }
  require("luasnip").config.set_config { history = true, enable_autosnippets = true }

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

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

          if source == "nvim_lsp" then
            vim_item.dup = 0
          end

          if source == "luasnip" then
            vim_item.dup = 0
            vim_item.kind = icons.misc.Forward
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "codeium" then
            vim_item.kind = icons.misc.Copilot
            vim_item.kind_hl_group = "CmpItemKindCopilot"
          end

          if entry.source.name == "lab.quick_data" then
            vim_item.kind = icons.misc.CircuitBoard
            vim_item.kind_hl_group = "CmpItemKindConstant"
          end

          return vim_item
        end,
      },
    },

    sorting = {
      priority_weight = 2,
      comparators = {
        cmp.config.compare.exact,
        cmp.config.compare.score,
        cmp.config.compare.kind,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    -- sources for autocompletion, priorties from top to bottom order
    -- tutorial: https://www.youtube.com/watch?v=yTk3C3JMKzQ&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=40
    sources = cmp.config.sources {
      { name = "nvim_lsp", priority = 1000, group_index = 1 }, -- lsp completions
      { name = "codeium", priority = 950, group_index = 2 }, -- completions from codeium
      { name = "luasnip", priority = 900, group_index = 3 }, -- snippets completions
      { name = "nvim_lua", priority = 850, group_index = 4 }, -- lua completions
      { name = "render-markdown", priority = 800, group_index = 5 }, -- markdown
      { name = "buffer", priority = 750, group_index = 6 }, -- completions from opened buffers
      { name = "path", priority = 700, group_index = 7 }, -- filesystem path completions
      { name = "tmux", priority = 650, group_index = 8, option = { all_panes = true, keyword_pattern = [[\w\+]] } }, -- tmux completions
      { name = "hledger", priority = 600, group_index = 9 }, -- hledger completions
    },
    completion = {
      -- keyword_length = 1,
      completeopt = "menu,menuone,noinsert,noselect",
    },
    confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = true },
    preselect = true and cmp.PreselectMode.Item or cmp.PreselectMode.None,
    window = {
      completion = cmp.config.window.bordered {
        side_padding = 1,
        col_offset = 0,
        border = {
          { "󱐋", "WarningMsg" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
      },

      documentation = cmp.config.window.bordered {
        side_padding = 1,
        col_offset = 1,
        border = {
          { "", "DiagnosticHint" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
      },
    },
    experimental = {
      ghost_text = true,
    },
  }
end

return M
