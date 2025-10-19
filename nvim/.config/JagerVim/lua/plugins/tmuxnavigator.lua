vim.pack.add { {
  src = 'christoomey/vim-tmux-navigator',
} }

local opts = {
  -- will be activated then any of theses are pressed
  -- or simply can use VeryLazy event (slow startup)
  keys = {
    '<C-h>',
    '<C-j>',
    '<C-k>',
    '<C-l>',
  },
}
