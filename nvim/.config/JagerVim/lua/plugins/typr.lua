local M = {
  'nvzone/typr',
  dependencies = {
    { 'nvzone/volt', lazy = true },
  },
  cmd = { 'Typr', 'TyprStats' },
}

-- In Typr window
--
-- p = toggle phrases
-- s = toggle symbols
-- n = toggle numbers
-- r = toggle random
-- 3 = set 3 lines , and so on!
-- In Typrstats vertical window
--
-- D = dashboard
-- H = history
-- K = Keystrokes

M.config = function()
  -- Resolve stats file path:
  local env_stats = vim.env.TYPR_STATFILE
  local default_stats = vim.fn.expand '~/.local/state/typrstats'
  -- If env var exists and not empty, use it; else fallback
  local resolved_stats_path = (env_stats and env_stats ~= '') and env_stats or default_stats

  require('typr').setup {
    mode = 'words', -- words, phrases
    winlayout = 'responsive',
    kblayout = 'qwerty',
    wpm_goal = 130,
    numbers = false,
    symbols = false,
    random = false,
    phrases = nil, -- can be a table of strings
    insert_on_start = false,
    -- stats_filepath = vim.fn.stdpath 'data' .. '/typrstats', -- default path
    stats_filepath = resolved_stats_path,
    mappings = nil,
    -- or function(buf) end
    -- mappings = function(buf)
    --  vim.keymap.set("n", "a, anything, { buffer = buf })
    -- end,
    on_attach = nil,
    -- or function(buf) end
    -- on_attach = function(buf)
    --  vim.b[buf].minipairs_disable = true
    -- end,
  }
end

return M
