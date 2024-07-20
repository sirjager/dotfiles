local ok, pkg = pcall(require, "actions-preview")
if not ok then
  return vim.notify("plugin not installed: actions-preview", vim.log.levels.ERROR)
end

-- default configs
--https://github.com/aznhe21/actions-preview.nvim
pkg.setup {
  -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
  diff = {
    ctxlen = 4,
  },

  -- priority list of external command to highlight diff
  -- disabled by defalt, must be set by yourself
  highlight_command = {
    -- require("actions-preview.highlight").delta(),
    -- require("actions-preview.highlight").diff_so_fancy(),
    -- require("actions-preview.highlight").diff_highlight(),
  },

  -- priority list of preferred backend
  backend = { "telescope", "nui" },

  -- options related to telescope.nvim
  telescope = vim.tbl_extend(
    "force",
    -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
    require("telescope.themes").get_dropdown(),
    -- a table for customizing content
    {
      -- a function to make a table containing the values to be displayed.
      -- fun(action: Action): { title: string, client_name: string|nil }
      make_value = nil,

      -- a function to make a function to be used in `display` of a entry.
      -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
      -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
      make_make_display = nil,
    }
  ),

  -- options for nui.nvim components
  nui = {
    -- component direction. "col" or "row"
    dir = "row",
    -- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
    keymap = nil,
    -- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
    layout = {
      position = "50%",
      size = {
        width = "60%",
        height = "60%",
      },
      min_width = 40,
      min_height = 40,
      relative = "editor",
    },
    -- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
    preview = {
      size = "60%",
      border = {
        padding = { 0, 1 },
        style = {
          top_left = "╭", top = "─", top_right = "╮",
          left = "│", right = "│",
          bottom_left = "╰", bottom = "─", bottom_right = "╯",
        },
      },
    },
    -- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
    select = {
      size = "40%",
      border = {
        padding = { 0, 1 },
        style = {
          top_left = "╭", top = "─", top_right = "╮",
          left = "│", right = "│",
          bottom_left = "╰", bottom = "─", bottom_right = "╯",
        },
      },
    },
  },
}
