local M = {
  "saghen/blink.cmp",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "rafamadriz/friendly-snippets",
  },
  version = "*",
  enabled = true,
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
        columns = { { "item_idx" }, { "kind_icon", gap = 2 }, { "label", "label_description", gap = 1 } },
        components = {
          item_idx = {
            text = function(ctx)
              return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
            end,
            highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
          },
        },
      },
    },
  },
  signature = {
    window = { border = "rounded" },
  },
}

-- stylua: ignore start
M.opts.keymap = {
  -- set to 'none' to disable the 'default' preset
  preset = "default",
  ["<C-space>"] = {function(cmp)cmp.show()end},
  ['<C-y>'] = { 'select_and_accept' },
  ['<TAB>'] = { 'select_and_accept' },
  ["<C-e>"] = {},

  ["<C-p>"] = { "select_prev", "fallback" },
  ["<C-k>"] = { "select_prev", "fallback" },
  ["<C-n>"] = { "select_next", "fallback" },
  ["<C-j>"] = { "select_next", "fallback" },

  ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
  ['<S-k>'] = { 'scroll_documentation_up', 'fallback' },
  ['<S-j>'] = { 'scroll_documentation_down', 'fallback' },
  ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

}
-- stylua: ignore end

M.config = function(_, opts)
  require("blink.cmp").setup(opts)
end

return M
