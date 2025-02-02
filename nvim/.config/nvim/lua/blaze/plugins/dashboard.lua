local M = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  lazy = false,
  priority = 1000,
}

M.opts = {
  theme = "hyper",
  disable_move = true,
  shortcut_type = "number", -- number | letter,
  shuffle_letter = false, -- default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
  hide = {
    statusline = true,
    tabline = false, -- bufferline
    winbar = true,
  },
  config = {
    header = require("blaze.banners").jagervim,
    disable_move = true,
    shortcut = {
      {
        action = "cd ~/dotfiles/nvim/.config/nvim | e ~/dotfiles/nvim/.config/nvim/init.lua",
        desc = "Config",
        icon = " ",
        key = "c",
      },
      {
        action = "cd ~/dotfiles | e ~/dotfiles/tmux/.config/tmux/tmux.conf",
        desc = "Tmux",
        icon = " ",
        key = "t",
      },
      {
        action = "Lazy",
        desc = "Lazy",
        icon = "󰒲 ",
        key = "l",
      },
      {
        action = "qa",
        desc = "Quit",
        icon = "󰅖 ",
        key = "q",
      },
    },
    packages = { enable = true },
    week_header = { enable = false },
    mru = { enable = false, limit = 7, cwd_only = true },
    project = {
      enable = false,
      limit = 5,
      label = "Projects",
      action = "Telescope find_files cwd=/mnt/storage/workspace",
    },
    footer = {},
  },
}

return M
