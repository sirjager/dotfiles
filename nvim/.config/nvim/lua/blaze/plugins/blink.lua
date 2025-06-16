local M = {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "*",
  enabled = function()
    return not vim.tbl_contains({}, vim.bo.filetype)
  end,
  dependencies = {
    { "moyiz/blink-emoji.nvim", event = "InsertEnter" },
    { "andersevenrud/cmp-tmux", event = "InsertEnter" },
    { "mgalliou/blink-cmp-tmux", event = "InsertEnter" },
    { "saghen/blink.compat", event = "InsertEnter" },
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "roobert/tailwindcss-colorizer-cmp.nvim", event = "InsertEnter" },
    { "L3MON4D3/LuaSnip", version = "v2.*" },
  },
}

M.opts = {
  snippets = { preset = "luasnip" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { window = { border = "rounded" } },
    menu = {
      border = "rounded",
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
              return kind_icon
            end,
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
              return hl
            end,
          },
          kind = {
            -- (optional) use highlights from mini.icons
            highlight = function(ctx)
              local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },
  signature = {
    window = { border = "rounded" },
  },
}

M.opts.sources = {
  transform_items = function(_, items)
    return vim.tbl_filter(function(item)
      return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
    end, items)
  end,

  per_filetype = {
    py = { "lsp", "codeium" },
  },

  default = {
    "lsp",
    "path",
    "copilot",
    "codeium",
    -- "snippets",
    "buffer",
    "tmux",
    "hledger",
  },
  providers = {
    lsp = {
      name = "LSP",
      module = "blink.cmp.sources.lsp",
      opts = {}, -- Passed to the source directly, varies by source
      enabled = true, -- Whether or not to enable the provider
      async = true, -- Whether we should show the completions before this provider returns, without waiting for it
      timeout_ms = 1000, -- How long to wait for the provider to return before showing completions and treating it as asynchronous
      transform_items = nil, -- Function to transform the items before they're returned
      should_show_items = true, -- Whether or not to show the items
      max_items = nil, -- Maximum number of items to display in the menu
      min_keyword_length = 0, -- Minimum number of characters in the keyword to trigger the provider
      -- If this provider returns 0 items, it will fallback to these providers.
      -- If multiple providers fallback to the same provider, all of the providers must return 0 items for it to fallback
      fallbacks = {},
      score_offset = 100, -- Boost/penalize the score of the items
      override = nil, -- Override the source's functions
    },
    copilot = {
      enabled = true,
      name = "codeium",
      module = "blink.compat.source",
    },
    codeium = {
      enabled = true,
      name = "codeium",
      module = "blink.compat.source",
    },
    hledger = {
      enabled = true,
      name = "hledger",
      module = "blink.compat.source",
    },
    ["tailwindcss-colorizer-cmp"] = {
      enabled = true,
      name = "tailwindcss-colorizer-cmp",
      module = "blink.compat.source",
    },
    tmux = {
      enabled = true,
      name = "tmux",
      module = "blink-cmp-tmux",
      opts = { all_panes = true, capture_history = false, triggered_only = false },
    },
  },
}

-- stylua: ignore start
M.opts.keymap = {
  -- set to 'none' to disable the 'default' preset
  preset = "none",
  ["<C-space>"] = {function(cmp)cmp.show()end},
  ['<C-y>'] = { 'select_and_accept' },
  ['<C-f>'] = { 'select_and_accept' },
  -- ['<TAB>'] = { 'select_and_accept' },
  ["<C-e>"] = {},

  ["<C-p>"] = { "select_prev"},
  ["<C-k>"] = { "select_prev" },
  ["<C-n>"] = { "select_next" },
  ["<C-j>"] = { "select_next" },

  -- ['<S-k>'] = { 'scroll_documentation_up' },
  -- ['<S-j>'] = { 'scroll_documentation_down' },

}
-- stylua: ignore end

M.config = function(_, opts)
  require("tailwindcss-colorizer-cmp").setup({ color_square_width = 2 })
  require("blink.cmp").setup(opts)
end

return M
