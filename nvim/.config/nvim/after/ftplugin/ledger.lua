---@diagnostic disable: missing-fields
require("cmp").setup.buffer {
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "hledger" },
    { name = "codeium" },
    { name = "tmux" },
  },
}
