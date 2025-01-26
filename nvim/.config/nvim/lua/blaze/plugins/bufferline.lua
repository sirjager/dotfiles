local M = {
  "akinsho/bufferline.nvim",
  event = "BufReadPost",
  cmd = {
    "BufferLinePick",
    "BufferLineTogglePin",
    "BufferLineGoToBuffer",
    "BufferLineCloseOthers",
  },
}

M.opts = {
  options = {
    separator_style = "thin", -- slant, padded_slant, slope, padded_slope, thick, thin
    numbers = "ordinal", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    -- close_command = "Bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    indicator_icon = "▎",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 21,
    diagnostics = "nvim_lsp", -- | "nvim_lsp" | "coc",
    -- offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    diagnostics_update_in_insert = false,
  },
}

return M
