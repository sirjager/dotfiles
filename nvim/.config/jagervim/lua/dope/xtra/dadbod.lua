local M = {
  "kristijanhusak/vim-dadbod-ui",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true, event = "VeryLazy" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true, event = "VeryLazy" },
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}

function M.config() end

return M
