local M = {
  "echasnovski/mini.files",
  version = "*",
  event = "VeryLazy",
}

M.opts = {
  content = {
    filter = nil,
    prefix = nil,
    sort = nil,
  },

  mappings = {
    close = "q",
    go_in = "l",
    go_in_plus = "L",
    go_out = "h",
    go_out_plus = "H",
    mark_goto = "M",
    mark_set = "m",
    reset = "r",
    reveal_cwd = "@",
    show_help = "g?",
    synchronize = "s",
    trim_left = "<",
    trim_right = ">",
  },

  -- General options
  options = {
    permanent_delete = false,
    use_as_default_explorer = true,
  },

  -- Customization of explorer windows
  windows = {
    -- Maximum number of windows to show side by side
    max_number = math.huge,
    -- Whether to show preview of file/directory under cursor
    preview = true,
    -- Width of focused window
    width_focus = 50,
    -- Width of non-focused window
    width_nofocus = 15,
    -- Width of preview window
    width_preview = 25,
  },
}

M.config = function()
  require("mini.files").setup(M.opts)
end

return M
