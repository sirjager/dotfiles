local ok, live_server = pcall(require, "live_server")
if ok then
  return
end

live_server.setup({
  port = 8000,
  browser_command = "chromium", -- Empty string starts up with default browser
  quiet = false,
  no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
  install_path = os.getenv("HOME") .."/.local/share/nvim/site/pack/packer/start/live-server",
})
