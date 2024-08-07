local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  after = "nvim-treesitter",
  lazy = true,
  event = "BufRead",
}

function M.config()
  require("lspsaga").setup {
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
      edit = "<CR>",
    },
    code_action = {
      num_shortcut = true,
      show_server_name = true, -- default false
      extend_gitsigns = true, -- default false
    },
    ui = {
      title = true,
      devicons = true,
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
      code_action = "💡", --  💡                                 
      lines = { "┗", "┣", "┃", "━", "┏" },
      colors = {},
      -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    },
    symbol_in_winbar = {
      enable = true,
    },
  }
end

return M
