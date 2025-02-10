local M = {
  "echasnovski/mini.icons",
  version = "*",
}

M.opts = {}

M.config = function(_, opts)
  require("mini.icons").setup(opts)
end

return M
