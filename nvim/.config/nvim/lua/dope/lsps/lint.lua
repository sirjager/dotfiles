local M = {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("lint").linters_by_ft = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
  }
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

return M
