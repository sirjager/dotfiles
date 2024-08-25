local M = {
  "numToStr/Comment.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    { "folke/todo-comments.nvim", lazy = true, event = "VeryLazy" },
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, event = "VeryLazy" },
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

M.todo_comments_opts = {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  keywords = {
    TODO = { icon = " ", color = "todo" },
    INFO = { icon = " ", color = "info" },
    HINT = { icon = " ", color = "hint" },
    NOTE = { icon = "󱜾 ", color = "note" },
    HACK = { icon = " ", color = "hack", alt = { "TRICK" } },
    WARN = { icon = " ", color = "warn", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", color = "perf", alt = { "PERFORMANCE", "OPTIMIZE" } },
    TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    FIX = { icon = " ", color = "fix", alt = { "FIXME", "FIXIT", "ISSUE", "ERROR", "BROKEN" } },
  },
  gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  colors = {
    todo = { "IdentifierTodo", "#F9E2AF" },
    hint = { "DiagnosticHint", "#A0D995" },
    note = { "DiagnosticNote", "#B3C8CF" },
    info = { "DiagnosticInfo", "#30A2FF" },
    hack = { "DiagnosticHac", "#F6995C" },
    warn = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    perf = { "DiagnosticPerf", "#FFBCBC" },
    test = { "DiagnosticTest", "#5AB2FF" },
    fix = { "DiagnosticError", "ErrorMsg", "#FF6969" },
    default = { "Identifier", "#9CB4CC" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}

function M.config()
  vim.g.skip_ts_context_commentstring_module = true
  require("ts_context_commentstring").setup(M.comment_string_opts)
  require("todo-comments").setup(M.todo_comments_opts)

  local hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
  require("Comment").setup(M.comment_opts(hook))
end

return M
