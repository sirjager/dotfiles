local M = {
  "goolord/alpha-nvim",
}

function M.config()
  local alpha = require "alpha"
  local headers = require "dope.core.banners"
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = headers.jagervim
  dashboard.section.buttons.val = {
    dashboard.button(
      "<leader>n",
      "  > Neovim configurations",
      ":cd ~/.config/nvim | :Neotree reveal_force_cwd<CR> | :e init.lua<CR>"
    ),
    dashboard.button(
      "<leader>t",
      "  > Tmux configurations",
      ":cd ~/.config/tmux | :Neotree reveal_force_cwd<CR> | :e tmux.conf<CR>"
    ),
    dashboard.button("<leader>q", "  > Quit NVIM", ":qa<CR>"),
  }

  alpha.setup(dashboard.opts)
end

return M
