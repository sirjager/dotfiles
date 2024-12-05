local opts = { silent = true, noremap = true }
vim.api.nvim_set_keymap("n", "<A-m>", ":Telescope flutter commands<CR>", opts)
