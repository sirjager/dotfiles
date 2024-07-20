local M = {
  "navarasu/onedark.nvim",
  dependencies = {
    -- "catppuccin/nvim",
  },
  lazy = false,
  priority = 1000,
}

M.onedark = {
  style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true,
  term_colors = true,
  ending_tildes = true,
  cmp_itemkind_reverse = true,
  toggle_style_key = nil,
  code_style = {
    comments = "italic",
    keywords = "bold",
    functions = "italic",
    strings = "none",
    variables = "bold",
  },
  lualine = { transparent = true },
  diagnostics = {
    darker = true,
    undercurl = true,
    background = false,
  },
}

M.catppuccin = {
  flavour = "auto", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
    -- miscs = {}, -- Uncomment to turn off hard-coded styles
  },
  color_overrides = {},
  custom_highlights = {},
  default_integrations = false,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = true,
    alpha = true,
    mini = {
      enabled = false,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
}

function M.config()
  local theme = "onedark"
  require(theme).setup(M[theme])
  vim.o.background = "dark"
  vim.cmd("colorscheme " .. theme)
  vim.cmd "hi LineNr guibg=none guifg=#8294C4"
end

return M
