vim.uv = vim.uv or vim.loop
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local lazy_configs = require "dope.core.lazy"

require("lazy").setup({
  spec = LAZY_PLUGIN_SPEC,
}, lazy_configs)
