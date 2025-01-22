local M = {
  "gelguy/wilder.nvim",
  dependencies = {
    "romgrk/fzy-lua-native",
  },
  event = { "VeryLazy" },
}

M.config = function()
  local wilder = require "wilder"
  wilder.setup { modes = { ":", "/", "?" } }

  wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
      min_width = "25%", -- minimum height of the popupmenu, can also be a number
      max_height = "20%", -- to set a fixed height, set max_height to the same value
      reverse = 0, -- if 1, shows the candidates from bottom to top
      highlighter = {
        wilder.lua_pcre2_highlighter(), -- Requires luarocks install pcre2
        wilder.lua_fzy_highlighter(), -- Requires fzy-lua-native
      },
      highlights = {
        default = "Normal",
        accent = "HoverNormal",
      },
      -- 'single', 'double', 'rounded' or 'solid'
      -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
      border = "rounded",
    })
  )
end

return M
