local M = {
  "L3MON4D3/LuaSnip",
}

function M.config()
  require("luasnip.loaders.from_lua").load { paths = { "~/.config/nvim/snippets/" } }
  require("luasnip").config.set_config {
    history = true,
    enable_autosnippets = true,
    ext_opts = {
      [require("luasnip.util.types").choiceNodes] = {
        active = {
          virt_text = { { "🪙", "GruvboxOrange" } },
        },
      },
    },
  }
end

return M
