local M = {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
}

function M.config()
  require("hlchunk").setup {
    chunk = { enable = true },
    -- duration = 100,
  }
end

return M
