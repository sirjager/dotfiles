local M = {
  '3rd/image.nvim',
  ft = { 'markdown', 'mdx', 'mdoc' },
}

M.opts = {
  backend = 'kitty',
  kitty_method = 'normal',
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { 'markdown', 'mdx', 'mdoc' },
    },
    html = { enabled = true },
    css = { enabled = true },
    neorg = { enabled = true },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,

  -- This is what I changed to make my images look smaller, like a
  -- thumbnail, the default value is 50
  -- max_height_window_percentage = 20,
  max_height_window_percentage = 40,

  -- toggles images when windows are overlapped
  window_overlap_clear_enabled = true,
  window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },

  -- auto show/hide images when the editor gains/looses focus
  editor_only_render_when_focused = false,

  -- auto show/hide images in the correct tmux window
  -- In the tmux.conf add `set -g visual-activity off`
  tmux_show_only_in_active_window = true,

  -- render image files as images when opened
  hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' },
}

return M
