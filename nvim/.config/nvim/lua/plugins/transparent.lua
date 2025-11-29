local M = {
  'xiyaowong/transparent.nvim',
  lazy = false,
}

M.opts = {
  transparent = vim.g.transparent_enabled,

  -- table: default groups
  groups = {
    'Normal',
    'NormalNC',
    'Comment',
    'Constant',
    'Special',
    'Identifier',
    'Statement',
    'PreProc',
    'Type',
    'Underlined',
    'Todo',
    'String',
    'Function',
    'Conditional',
    'Repeat',
    'Operator',
    'Structure',
    'LineNr',
    'NonText',
    'SignColumn',
    'CursorLine',
    'CursorLineNr',
    'StatusLine',
    'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    'NormalFloat',
    'HoverBorder',
    'FloatBorder',
    'FloatTitle',
    'NvimTreeNormal',
    'BlinkCmpMenu',
    'BlinkCmpMenuBorder',
  },
}

M.config = function(_, opts)
  require('transparent').setup(opts)
end

return M
