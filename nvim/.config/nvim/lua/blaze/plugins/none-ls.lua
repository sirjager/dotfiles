local M = {
  "nvimtools/none-ls.nvim",
}

M.opts = function(nonels)
  return {
    debug = false,
    sources = {
      nonels.builtins.formatting.stylua, -- lua
      nonels.builtins.formatting.shfmt, -- sh/bash

      nonels.builtins.diagnostics.buf, -- proto
      nonels.builtins.formatting.buf, -- proto

      nonels.builtins.formatting.yamlfix,
      nonels.builtins.formatting.sqlfmt,

      -- ts/js
      nonels.builtins.formatting.prettierd, -- ts/js,json
      -- require "none-ls.diagnostics.eslint_d",
      -- require "none-ls.formatting.eslint_d",
      -- require "none-ls.code_actions.eslint_d",
      -- nonels.builtins.formatting.biome.with { extra_filtypes = { "astro", "svelte", "vue" } },

      -- go
      nonels.builtins.diagnostics.golangci_lint, -- go
      nonels.builtins.formatting.gofumpt, -- go
      nonels.builtins.formatting.goimports_reviser, -- go imports

      -- python
      nonels.builtins.formatting.black,
      nonels.builtins.diagnostics.mypy,
      -- nonels.builtins.diagnostics.ruff,
    },
  }
end

M.config = function(_, opts)
  local nonels = require "none-ls"
  nonels.setup(opts(nonels))
end

return M
