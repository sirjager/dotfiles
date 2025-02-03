local M = {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  event = { "VimEnter" },
}

M.opts = {
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  indent = { enabled = false },
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

M.opts.picker = {
  enabled = true,
  debug = {
    scores = true,
  },
  matcher = {
    frecency = true,
  },
  win = {
    input = {
      keys = {
        ["<Esc>"] = { "close", mode = { "n", "i" } },
        ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
        ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
        ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
        ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
      },
    },
  },
}

M.opts.dashboard = {
  enabled = true,
}

return M
