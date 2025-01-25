local M = {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    global_settings = {
      save_on_toggle = true,
      save_on_change = true,
    },
  },
}

vim.api.nvim_create_user_command("HarpoonToggle", function()
  require("harpoon.ui").toggle_quick_menu()
end, {})

vim.api.nvim_create_user_command("HarpoonMark", function()
  require("harpoon.mark").add_file()
  vim.notify("󱡅  marked file", vim.log.levels.INFO)
end, {})

vim.api.nvim_create_user_command("HarpoonNextMarked", function()
  require("harpoon.ui").nav_next()
end, {})

vim.api.nvim_create_user_command("HarpoonPrevMarked", function()
  require("harpoon.ui").nav_prev()
end, {})

return M
