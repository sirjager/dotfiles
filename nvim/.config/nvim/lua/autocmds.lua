vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- text highlight when yanking
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 120 }
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.md", "*.mdoc", "*.mdx" },
  command = "set filetype=markdown"
})
