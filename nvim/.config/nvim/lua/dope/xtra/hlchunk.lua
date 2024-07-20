local M = {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
}

function M.config()
  require("hlchunk").setup {
    chunk = { enable = true },
    -- duration = 100,
    delay = 50,
  }
end

return M
