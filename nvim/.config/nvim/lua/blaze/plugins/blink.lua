local M = {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "*",
  enabled = true,
  dependencies = {
    { "saghen/blink.compat", event = "InsertEnter" },
    { "moyiz/blink-emoji.nvim", event = "InsertEnter" },
    { "rafamadriz/friendly-snippets", event = "InsertEnter" },
    { "andersevenrud/cmp-tmux", event = "InsertEnter" },
    { "roobert/tailwindcss-colorizer-cmp.nvim", event = "InsertEnter" },
  },
}

M.opts = {
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { window = { border = "rounded" } },
    menu = {
      border = "rounded",
      draw = {
        -- columns = { { "item_idx" }, { "kind_icon", gap = 2 }, { "label", "label_description", gap = 1 } },
        -- components = {
          -- stylua: ignore start
          -- item_idx = {text = function(ctx)return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)end,highlight = "BlinkCmpItemIdx"},
          -- stylua: ignore end
        -- },
      },
    },
  },
  signature = {
    window = { border = "rounded" },
  },
}

M.opts.sources = {
  default = {
    "lsp",
    "path",
    "codeium",
    "snippets",
    "buffer",
    "render-markdown",
    "tmux",
    "hledger",
  },
  providers = {
    tmux = {
      enabled = true,
      name = "hledger",
      module = "blink.compat.source",
    },
    codeium = {
      enabled = true,
      name = "hledger",
      module = "blink.compat.source",
    },
    hledger = {
      enabled = true,
      name = "hledger",
      module = "blink.compat.source",
    },
    ["render-markdown"] = {
      enabled = true,
      name = "render-markdown",
      module = "blink.compat.source",
    },
    ["tailwindcss-colorizer-cmp"] = {
      enabled = true,
      name = "tailwindcss-colorizer-cmp",
      module = "blink.compat.source",
    },
  },
}

-- stylua: ignore start
M.opts.keymap = {
  -- set to 'none' to disable the 'default' preset
  preset = "default",
  ["<C-space>"] = {function(cmp)cmp.show()end},
  ['<C-y>'] = { 'select_and_accept' },
  ['<C-f>'] = { 'select_and_accept' },
  ["<C-e>"] = {},

  ["<C-p>"] = { "select_prev", "fallback" },
  ["<C-k>"] = { "select_prev", "fallback" },
  ["<C-n>"] = { "select_next", "fallback" },
  ["<C-j>"] = { "select_next", "fallback" },

  ['<S-k>'] = { 'scroll_documentation_up', 'fallback' },
  ['<S-j>'] = { 'scroll_documentation_down', 'fallback' },

}
-- stylua: ignore end

M.config = function(_, opts)
  require("tailwindcss-colorizer-cmp").setup { color_square_width = 2 }
  require("blink.cmp").setup(opts)
end

return M
