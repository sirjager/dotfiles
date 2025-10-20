local M = {
  'glepnir/lspsaga.nvim',
  branch = 'main',
  after = 'nvim-treesitter',
  cmd = { 'Lspsaga' },
}

M.opts = {
  scroll_preview = { scroll_down = '<C-f>', scroll_up = '<C-b>' },
  definition = {
    edit = '<CR>',
  },
  code_action = {
    num_shortcut = true,
    -- show_server_name = true, -- default false
    -- extend_gitsigns = true, -- default false
  },
  ui = {
    title = true,
    devicons = true,
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }, -- single | double | shadow etc.
    code_action = '💡', --  💡                                 
    lines = { '┗', '┣', '┃', '━', '┏' },
    -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    colors = {},
  },
  symbol_in_winbar = {
    enable = false,
  },
}

M.config = function(_, opts)
  require('lspsaga').setup(opts)
end

return M
