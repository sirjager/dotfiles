local M = {
  "numToStr/Comment.nvim",
  event = "BufReadPost",
  dependencies = {
    { "folke/todo-comments.nvim" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
}

M.comment_string_opts = {
  enable_autocmd = false,
  languages = {
    typescript = "// %s",
    css = "/* %s */",
    scss = "/* %s */",
    html = "<!-- %s -->",
    svelte = "<!-- %s -->",
    vue = "<!-- %s -->",
    json = "// %s",
    ledger = "; %s",
  },
}

M.comment_opts = function(hook)
  return {
    pre_hook = hook,
    padding = true,
    sticky = true,
    toggler = { line = "gcc", block = "gbc" },
    opleader = { line = "gc", block = "gb" },
    extra = { above = "gcO", below = "gco", eol = "gcA" },
    mappings = { basic = true, extra = true },
  }
end

function M.config()
  vim.g.skip_ts_context_commentstring_module = true
  require("ts_context_commentstring").setup(M.comment_string_opts)
  local hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  require("Comment").setup(M.comment_opts(hook))
end

return M
