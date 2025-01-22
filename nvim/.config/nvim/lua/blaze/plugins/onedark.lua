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
  highlights = require("blaze.colors"),
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
  vim.cmd "colorscheme onedark"
  vim.cmd "hi LineNr guibg=none guifg=#525280"
end

return M
