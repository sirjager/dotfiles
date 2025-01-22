local M = {
  "ThePrimeagen/harpoon",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  require("harpoon").setup {
    global_settings = {
      save_on_toggle = true,
      save_on_change = true,
    },
  }
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify("󱡅  marked file", vim.log.levels.INFO)
end

function M.toggle_menu()
  require("harpoon.ui").toggle_quick_menu()
end

function M.next_file()
  require("harpoon.ui").nav_next()
end

function M.prev_file()
  require("harpoon.ui").nav_prev()
end

return M
