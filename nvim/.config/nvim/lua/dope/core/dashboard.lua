local M = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
}

-- https://github.com/nvimdev/dashboard-nvim

local logo = require("dope.core.banners").jagervim

M.shortcuts = {
  { action = "Telescope find_files hidden=true no_ignore=false color=always<CR>", desc = " Find File", icon = " ", key = "f" },
  { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
  { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
  { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
  { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
  { action = "qa", desc = " Quit", icon = " ", key = "q" },
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
  hide = {
    statusline = false,
    tabline = false,
    winbar = false,
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
  shortcut_type = "letter", -- number | letter,
  shuffle_letter = false, -- default is true, shortcut 'letter' will be randomize, set to false to have ordered letter.
  hide = {
    statusline = false,
  },
  config = {
    header = logo,
    week_header = {
      enable = false,
    },
    shortcut = M.shortcuts,
    mru = { limit = 10, cwd_only = false },
    project = { enable = false, limit = 8, label = "Projects", action = "Telescope find_files cwd=/mnt/storage/workspace" },
    packages = { enable = true },
  },
  footer = M.footer(),
}

function M.config()
  require("dashboard").setup(M.hyper)
end

return M
