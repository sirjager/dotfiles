local M = {
  "aurum77/live-server.nvim",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("live_server").setup {
    port = 8000,
    browser_command = "chromium", -- Empty string starts up with default browser
    quiet = false,
    no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
    install_path = os.getenv "HOME" .. "/.local/share/nvim/site/pack/packer/start/live-server",
  }
end

return M
