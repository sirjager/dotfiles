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
    reset = "R",
    reveal_cwd = "@",
    show_help = "g?",
    synchronize = "s",
    trim_left = "<",
    trim_right = ">",
  },

  options = {
    permanent_delete = true,
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

M.config = function(_, opts)
  require("mini.files").setup(opts)
end

return M
