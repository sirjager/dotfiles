local M = {
  "nvzone/typr",
  cmd = "TyprStats",
  dependencies = "nvzone/volt",
}

M.config = function()
  require("typr").setup()
end

return M
