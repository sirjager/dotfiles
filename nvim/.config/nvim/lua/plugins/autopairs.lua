local M = {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'kylechui/nvim-surround',
  },
}

M.opts = {
  check_ts = true,
  map_char = {
    all = '(',
    tex = '{',
  },
  enable_check_bracket_line = false,
  ts_config = {
    lua = { 'string', 'source' },
    javascript = { 'string', 'template_string' },
    java = false,
  },
  disable_filetype = { 'TelescopePrompt', 'spectre_panel', 'vim' },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
  enable_moveright = true,
  disable_in_macro = false,
  enable_afterquote = true,
  map_bs = true,
  map_c_w = false,
  fast_wrap = {
    map = '<A-r>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    offset = 0, -- Offset from pattern match
    end_key = '$',
    keys = 'qwertyuiopzxcvbnmasdfghjkl',
    check_comma = true,
    highlight = 'PmenuSel',
    highlight_grey = 'LineNr',
  },
}

M.config = function(_, opts)
  require('nvim-autopairs').setup(opts)
  require('nvim-ts-autotag').setup()
  require('nvim-surround').setup()
end

return M
