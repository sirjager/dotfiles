local M = {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = "BufReadPost",
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
