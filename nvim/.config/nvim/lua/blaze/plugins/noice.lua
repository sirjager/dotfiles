local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
}

M.opts = {
  cmdline = {
    enabled = true,
    view = "cmdline_popup", -- `cmdline_popup` | `cmdline`
  },
  messages = {
    enabled = true, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
  },
  popupmenu = {
    enabled = true, 
    backend = "nui", 
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = false, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
  routes = {
    {
      filter = { event = "notify", find = "No information available" },
      opts = { skip = true },
    },
    {
      filter = { event = "notify", find = "completion request failed" },
      opts = { skip = true },
    },
   {
      filter = { event = "notify", find = "LSP[gopls] Invalid settings: setting option hints: invalid type []interface {} (want JSON object)" },
      opts = { skip = true },
    },
  },
}

return M
