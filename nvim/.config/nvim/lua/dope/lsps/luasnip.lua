local M = {
  "L3MON4D3/LuaSnip",
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    { "rafamadriz/friendly-snippets", lazy = true },
    { "hrsh7th/vim-vsnip", event = "InsertEnter", lazy = true },
    { "hrsh7th/vim-vsnip-integ", event = "InsertEnter", lazy = true },
  },
}

function M.config()
  require("luasnip").filetype_extend("dart", { "flutter" })
  require("luasnip/loaders/from_vscode").lazy_load()
  require("tailwindcss-colorizer-cmp").setup { color_square_width = 2 }
  require("luasnip").config.set_config { history = true, enable_autosnippets = true }
end

return M
