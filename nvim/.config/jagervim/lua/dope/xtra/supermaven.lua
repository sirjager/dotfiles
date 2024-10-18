local M = {
  "supermaven-inc/supermaven-nvim",
  lazy = true,
  event = "VeryLazy",
}

M.opts = {
  keymaps = {
    accept_suggestion = "<Tab>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  ignore_filetypes = { cpp = true },
  color = {
    suggestion_color = "#ffffff",
    cterm = 244,
  },
  log_level = "info", -- set to "off" to disable logging completely
  disable_inline_completion = false, -- disables inline completion for use with cmp
  disable_keymaps = false, -- disables built in keymaps for more manual control
}

function M.config()
  require("supermaven-nvim").setup(M.opts)
end

return M
