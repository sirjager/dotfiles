local M = {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
}

M.opts = {
  symbol_folding = {
    -- Unfold entire symbol tree by default with false, otherwise enter a
    -- number starting from 1
    autofold_depth = false,
    -- autofold_depth = 1,
  },
  outline_window = {
    -- Percentage or integer of columns
    width = 20,
  },
}

M.config = function(_,opts)
  require("outline").setup(opts)
end

return M
