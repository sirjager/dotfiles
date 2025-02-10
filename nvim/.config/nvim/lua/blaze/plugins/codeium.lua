local M = {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
}

M.opts = {
  enable_cmp_source = false,
  virtual_text = {
    enabled = false,
  },
}

M.config = function(_, opts)
  require("codeium").setup(opts)
end

return M
