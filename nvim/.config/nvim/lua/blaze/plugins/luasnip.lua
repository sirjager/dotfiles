local M = {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
}

M.config = function()
  local ls = require "luasnip"
  ls.setup()

  -- local s = ls.snippet
  -- local t = ls.text_node
  -- local i = ls.insert_node
  local c = ls.choice_node
  -- local f = ls.function_node
  -- local xtra = require "luasnip.extras"
  -- local rep = xtra.rep
  -- local fmt = require("luasnip.extras.fmt").fmt
  -- local typ = require("luasnip.util.types").fmt

  ls.filetype_extend("dart", { "flutter" })
  ls.config.set_config {
    history = true,
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
    ext_opts = {
      [c] = {
        active = { virt_text = { { " ", "Error" } } },
      },
    },
  }

  --
end

return M
