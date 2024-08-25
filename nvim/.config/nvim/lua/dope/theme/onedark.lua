local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
}

M.opts = {
  -- Default theme style. Choose between
  -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  style = "cool",
  transparent = true,
  term_colors = true,
  ending_tildes = true,
  cmp_itemkind_reverse = true,
  toggle_style_key = nil,
  lualine = { transparent = true },
  highlights = require "dope.theme.hlgroups",
  code_style = {
    comments = "italic",
    keywords = "bold",
    functions = "italic",
    strings = "none",
    variables = "bold",
  },
  diagnostics = {
    darker = true,
    undercurl = true,
    background = true,
  },
}

function M.config()
  local theme = "onedark"
  require(theme).setup(M.opts)
  vim.o.background = "dark"
  vim.cmd("colorscheme " .. theme)
  vim.cmd "hi LineNr guibg=none guifg=#8294C4"
end

return M
