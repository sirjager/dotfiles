local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

-- UNCOMMENT BELOW: -- If you want to set up formatting on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,     -- lua

    null_ls.builtins.formatting.shfmt,      -- sh/bash

    -- null_ls.builtins.diagnostics.buf,       -- proto
    null_ls.builtins.formatting.buf,        -- proto
    -- null_ls.builtins.diagnostics.protolint, -- proto

    -- null_ls.builtins.formatting.sqlfmt,     -- sql


    null_ls.builtins.formatting.prettierd, -- ts,tsx,js,jsx,html, ...etc.

    -- null_ls.builtins.formatting.black,     -- py
    -- null_ls.builtins.formatting.isort,     -- py imports

    -- null_ls.builtins.diagnostics.yamllint, -- yml/yaml
    null_ls.builtins.formatting.yamlfix,   -- yml/yaml

    -- null_ls.builtins.formatting.markdownlint, -- mdx/md/markdow

    -- null_ls.builtins.formatting.dart_format, -- dart


    -- WARN: Avoid using these, they are removed from none-ls in latest version
    -- as they are no longer maintained
    --
    -- null_ls.builtins.diagnostics.eslint_d, -- removed from none-ls stable
    -- null_ls.builtins.code_actions.eslint_d, -- removed from none-ls stable
    -- null_ls.builtins.code_actions.shellcheck,   -- sh/bash
    -- null_ls.builtins.formatting.jq,         -- json
    -- null_ls.builtins.diagnostics.ruff, -- rust


    -- HACK: if you still want to use above
    --
    require("none-ls.diagnostics.eslint_d"),
    require("none-ls.formatting.eslint_d"),
    require("none-ls.code_actions.eslint_d"),
    require("none-ls-shellcheck.diagnostics"),
    require("none-ls-shellcheck.code_actions"),

    null_ls.builtins.formatting.gofumpt,           -- go
    null_ls.builtins.diagnostics.golangci_lint,    -- go
    null_ls.builtins.formatting.goimports_reviser, -- go imports
    null_ls.builtins.formatting.golines,           -- go

    --
  },

  -- -- NOTE: UNCOMMENT BELOW: -- If you want to configure format on save
  --
  -- on_attach = function(client, bufnr)
  --   if client.supports_method "textDocument/formatting" then
  --     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 5000 }
  --         local okgo, _ = pcall(require, "go")
  --         if okgo then
  --           require("go.format").gofmt()
  --           require("go.format").goimport();
  --         end
  --       end,
  --     })
  --   end
  -- end,

}
