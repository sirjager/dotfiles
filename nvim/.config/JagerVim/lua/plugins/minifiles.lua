vim.pack.add {
  { src = 'echasnovski/mini.files' },
  { src = 'rafamadriz/friendly-snippets' },
}

local opts = {
  content = {
    filter = nil,
    prefix = nil,
    sort = nil,
  },

  mappings = {
    close = 'q',
    go_in = 'l',
    go_in_plus = 'L',
    go_out = 'h',
    go_out_plus = 'H',
    mark_goto = 'M',
    mark_set = 'm',
    reset = 'R',
    reveal_cwd = '.',
    show_help = 'g?',
    synchronize = 's',
    trim_left = '<',
    trim_right = '>',
  },

  options = {
    -- - Delete file or directory by deleting **whole line** describing it.
    -- - If `options.permanent_delete` is `true`, delete is permanent. Otherwise
    -- file system entry is moved to a module-specific trash directory
    -- (see |MiniFiles.config| for more details).
    -- ~/.local/share/nvim/mini.files/trash
    permanent_delete = false,

    use_as_default_explorer = true,
  },

  windows = {
    max_number = math.huge,
    preview = false,
    width_focus = 50,
    width_nofocus = 15,
    width_preview = 25,
  },
}

require('mini.files').setup(opts)
