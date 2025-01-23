local M = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
}

-- https://github.com/nvimdev/dashboard-nvim
local logo = require("blaze.banners").jagervim

M.shortcuts = {
  {
    action = "cd ~/dotfiles/nvim/.config/nvim | e ~/dotfiles/nvim/.config/nvim/init.lua",
    desc = " Config",
    icon = " ",
    key = "c",
  },
  {
    action = "cd ~/dotfiles | e ~/dotfiles/tmux/.config/tmux/tmux.conf",
    desc = " Tmux",
    icon = " ",
    key = "t",
  },
  {
    action = "Lazy",
    desc = " Lazy",
    icon = "󰒲 ",
    key = "L",
  },
  {
    action = "qa",
    desc = " Quit",
    icon = " ",
    key = "q",
  },
}

M.footer = function()
  ---@diagnostic disable-next-line: no-unknown
  local stats = require("lazy").stats()
  local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
  return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
end

M.doom = {
  theme = "doom",
  disable_move = true,
  vertical_center = false,
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    header = logo,
    center = M.shortcuts,
  },
  footer = M.footer(),
}

M.hyper = {
  theme = "hyper",
  disable_move = true,
  shortcut_type = "number", -- number | letter,
  shuffle_letter = false, -- default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
  hide = {
    statusline = true,
    tabline = true,
    winbar = true,
  },
  config = {
    header = logo,
    shortcut = M.shortcuts,
    packages = { enable = true },
    week_header = { enable = false },
    mru = { enable = false, limit = 7, cwd_only = true },
    project = {
      enable = false,
      limit = 5,
      label = "Projects",
      action = "Telescope find_files cwd=/mnt/storage/workspace",
    },
  },
  footer = M.footer(),
}

function M.config()
  require("dashboard").setup(M.hyper)
end

return M
