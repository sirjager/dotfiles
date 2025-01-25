local M = {
  "0x100101/lab.nvim",
  build = "cd js && npm ci",
}

M.opts = {
  code_runner = {
    enabled = true,
  },
  quick_data = {
    enabled = false,
  },
}

return M
