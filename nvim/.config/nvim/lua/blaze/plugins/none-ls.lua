local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPost",
  -- dependencies = {
  --   { "nvimtools/none-ls-extras.nvim" },
  --   { "gbprod/none-ls-shellcheck.nvim" },
  -- },
}

function M.config()
  local null_ls = require("null-ls")
  null_ls.setup({
    debug = false,
    sources = {
      null_ls.builtins.formatting.stylua, -- lua
      null_ls.builtins.formatting.shfmt, -- sh/bash

      null_ls.builtins.diagnostics.buf, -- proto
      null_ls.builtins.formatting.buf, -- proto

      null_ls.builtins.formatting.yamlfix,
      null_ls.builtins.formatting.sqlfmt,

      null_ls.builtins.formatting.markdownlint, -- mdx/md/markdow

      -- ts/js
      null_ls.builtins.formatting.prettierd, -- ts/js,json
      -- require "none-ls.diagnostics.eslint_d",
      -- require "none-ls.formatting.eslint_d",
      -- require "none-ls.code_actions.eslint_d",
      -- null_ls.builtins.formatting.biome.with { extra_filtypes = { "astro", "svelte", "vue" } },

      -- go
      null_ls.builtins.diagnostics.golangci_lint, -- go
      null_ls.builtins.formatting.gofumpt, -- go
      null_ls.builtins.formatting.goimports_reviser, -- go imports

      -- python
      null_ls.builtins.formatting.black,
      null_ls.builtins.diagnostics.mypy,
    },
  })
end

return M
