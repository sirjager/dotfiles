local M = {
  "windwp/nvim-ts-autotag",
  ft = { "javascript", "markdown", "typescript", "javascriptreact", "typescriptreact" }
}


function M.config()
  require("nvim-ts-autotag").setup({
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "html",
    },
  })
end

return M
