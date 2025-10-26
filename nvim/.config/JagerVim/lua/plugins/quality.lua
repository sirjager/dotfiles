local M = {
  'nvim-lua/plenary.nvim',
  branch = 'master',

  dependencies = {
    { 'vhyrro/luarocks.nvim', config = true },

    { 'nvzone/volt', lazy = true },

    { 'declancm/maximize.nvim', cmd = { 'Maximize' } },

    { 'christoomey/vim-tmux-navigator', keys = { '<C-h>', '<C-j>', '<C-k>', '<C-l>' } },

    { 'RRethy/vim-illuminate', event = 'BufReadPost' },

    { 'echasnovski/mini.icons' },

    { 'j-hui/fidget.nvim' },

  },
}

M.fidget_opts = {
  notification = {
    window = {
      normal_hl = 'DashboardShortCut', -- Base highlight group in the notification window
      winblend = 0, -- Background color opacity in the notification window
      border = 'rounded', -- Border around the notification window
      align = 'top', -- How to align the notification window
    },
  },
}

M.config = function(_, __)
  require('luarocks-nvim').setup()
  require('maximize').setup()
  require('illuminate').configure()
  require('fidget').setup(M.fidget_opts)
end

return M
