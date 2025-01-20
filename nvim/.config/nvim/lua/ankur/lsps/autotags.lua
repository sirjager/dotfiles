local M = {
  "windwp/nvim-ts-autotag",
}

M.filetypes = {
  "javascript",
  "markdown",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}

function M.config()
  require("nvim-ts-autotag").setup { ft = M.filetypes }
end

return M
