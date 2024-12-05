local M = {}

function M.opts(null_ls)
  return {
    debug = false,
    sources = {
      null_ls.builtins.formatting.stylua, -- lua
      null_ls.builtins.formatting.shfmt,  -- sh/bash

      null_ls.builtins.diagnostics.buf,   -- proto
      null_ls.builtins.formatting.buf,    -- proto

      null_ls.builtins.formatting.yamlfix,
      null_ls.builtins.formatting.sqlfmt,

      null_ls.builtins.formatting.prettierd, -- ts/js,json
      null_ls.builtins.formatting.biome.with { extra_filtypes = { "astro", "svelte", "vue" } },

      null_ls.builtins.diagnostics.golangci_lint,    -- go
      null_ls.builtins.formatting.gofumpt,           -- go
      null_ls.builtins.formatting.goimports_reviser, -- go imports
    },
  }
end

return M
