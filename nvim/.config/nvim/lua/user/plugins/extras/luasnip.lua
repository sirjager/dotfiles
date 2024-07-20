local ok, ls = pcall(require, "luasnip")
if not ok then
  return
end

require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/snippets/" }

ls.config.set_config {
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
