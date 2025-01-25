local M = {
  "rcarriga/nvim-notify",
}

M.opts = {
  background_colour = "#000000",
  fps = 60,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "compact", -- default, minimal, simple, compact
  stages = "fade_in_slide_out", -- fade_in_slide_out, fade, slide, static
  timeout = 2500,
  top_down = true,
}

function M.config(_, opts)
  local notify = require "notify"
  notify.setup(opts)

  local banned_messages = {
    "No information available",
    "LSP[gopls] Invalid settings: setting option hints: invalid type []interface {} (want JSON object)", -- comes when disabling lsp_inlay_hints. go.lsp_inlay_hints.enable = false
    "completion request failed",
  }
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.notify = function(msg, ...)
    for _, banned in ipairs(banned_messages) do
      if msg == banned then
        return
      end
    end
    return require "notify"(msg, ...)
  end
end

return M
