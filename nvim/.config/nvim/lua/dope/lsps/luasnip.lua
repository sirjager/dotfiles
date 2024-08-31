local M = {
  "L3MON4D3/LuaSnip",
  lazy = true,
  event = "BufReadPost",
}

function M.config()
  require("luasnip").filetype_extend("dart", { "flutter" })
  require("luasnip/loaders/from_vscode").lazy_load()
  require("luasnip.loaders.from_lua").load { paths = { "~/.config/nvim/snippets/" } }
  require("luasnip/loaders/from_vscode").lazy_load { paths = "~/.local/share/nvim/vim-snippets/snippets" }
  require("luasnip").config.set_config {
    history = true,
    enable_autosnippets = true,
  }
end

return M
