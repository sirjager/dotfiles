local M = {
  'folke/snacks.nvim',
  lazy = false,
  priority = 1000,
  event = { 'VimEnter' },
}

M.opts = {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = { enabled = true, timeout = 3000 },
  quickfile = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  toggle = { enabled = true },
  styles = { notification = { wo = { wrap = true } } },
  zen = { enabled = true },
}

M.opts.toggle = {
  enabled = true,
  map = vim.keymap.set,
  notify = true,
  which_key = true,
  icon = { enabled = ' ', disabled = ' ' },
  color = { enabled = 'green', disabled = 'yellow' },
}

M.opts.picker = {
  enabled = true,
  debug = {
    scores = true,
  },
  matcher = {
    frecency = true,
  },
  layout = { preset = 'ivy', cycle = false },
  layouts = {
    vertical = {
      layout = {
        backdrop = false,
        width = 0.8,
        min_width = 80,
        height = 0.8,
        min_height = 30,
        box = 'vertical',
        border = 'rounded',
        title = '{title} {live} {flags}',
        title_pos = 'center',
        { win = 'input', height = 1, border = 'bottom' },
        { win = 'list', border = 'none' },
        { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
      },
    },
    ivy = {
      layout = {
        box = 'vertical',
        backdrop = false,
        row = -1,
        width = 0,
        height = 0.5,
        border = 'top',
        title = ' {title} {live} {flags}',
        title_pos = 'left',
        { win = 'input', height = 1, border = 'bottom' },
        {
          box = 'horizontal',
          { win = 'list', border = 'none' },
          { win = 'preview', title = '{preview}', width = 0.5, border = 'left' },
        },
      },
    },
  },

  win = {
    input = {
      keys = {
        ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
        ['J'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
        ['K'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
        ['H'] = { 'preview_scroll_left', mode = { 'i', 'n' } },
        ['L'] = { 'preview_scroll_right', mode = { 'i', 'n' } },
      },
    },
  },
}

M.opts.dashboard = {
  enabled = true,
  preset = {
    header = require('globals.banners').threeskulls_v1,
    -- stylua: ignore start
    keys = {
      { icon = " ",key = "d", desc = "Dotfiles",action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('~/dotfiles')})"},
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },

    -- stylua: ignore end
    },
  },
}

M.opts.lazygit = {
  enabled = true,
}

M.config = function(_, opts)
  require('snacks').setup(opts)
end

return M
