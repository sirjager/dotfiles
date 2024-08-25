local M = {
  "shellRaining/hlchunk.nvim",
  lazy = true,
  event = "VeryLazy",
}

function M.config()
  require("hlchunk").setup {
    chunk = { enable = true },
    -- duration = 100,
  }
end

return M
