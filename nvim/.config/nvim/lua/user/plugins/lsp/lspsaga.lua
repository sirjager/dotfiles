local ok, lspsaga = pcall(require, "lspsaga")
if not ok then
  return vim.notify("plugin not installed: lspsaga", vim.log.levels.ERROR)
end

lspsaga.setup {
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  definition = {
    edit = "<CR>",
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true, -- default false
    extend_gitsigns = true,  -- default false
  },
  ui = {
    title = true,
    devicons = true,
    border = "single",
    code_action = "💡", --  💡                                 
    lines = { "┗", "┣", "┃", "━", "┏" },
    colors = {
      normal_bg = "#022746",
    },
    -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
  },
}
