local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "jayp0521/mason-null-ls.nvim",
    "nvim-lua/plenary.nvim",
  },
}

M.mason_servers = {
  "luacheck",
  "shellcheck",
  "shfmt",
  "tailwindcss-language-server",
  "typescript-language-server",
  "css-lsp",
}

M.mason_lspconfig_servers = {
  -- "astro",
  "lua_ls",
  "bashls",
  -- "clangd",
  "cssls",
  "emmet_ls",
  "gopls", -- go
  "golangci_lint_ls",
  "html", -- html
  "jsonls", -- json
  -- "marksman", -- md
  "tsserver", -- ts
  "tailwindcss",
  "cssmodules_ls",
  "yamlls", -- yml
  -- "sqlls",
  -- "pylsp",
  -- "pyright", -- py
  -- "prismals",
  -- "eslint", -- ts,js
  -- "phpactor",
  -- "intelephense",
}

M.mason_null_ls_servers = {
  "astro-language-server", -- astro
  -- "black", -- py
  -- "codelldb", -- rust, c,cpp debugger
  -- "debugpy", -- py
  -- "beautysh",
  "buf",
  -- "terraform-ls",
  "buf-language-server",
  -- "eslint", -- ts,js
  "eslint_d", -- ts,js
  "gofumpt", -- go
  -- "mypy", -- py
  "codespell",
  -- "yamllint", -- yml
  -- "ruff", -- py
  -- "rustywind",
  "shellharden", -- sh
  "shellcheck",
  -- "jq",
  "shfmt",
  -- "sqlfmt",
  -- "sql-formatter",
  "fixjson",
  "golangci-lint",
  "gospel",
  "gofumpt",
  "goimports_reviser", -- go
  -- "golines",                         -- go
  "lua-language-server", -- lua
  -- "svelte-language-server",          -- lua
  -- "docker-compose-language-service", -- docker-compose.yaml
  -- "dockerfile-language-server", -- Dockerfile
  -- "markdownlint",                    -- md
  -- "mdx_analyzer",
  "prettierd", -- ts, js
  -- "rust-analyzer", -- rust
  "stylua", -- lua
  "typescript-languange-server", -- ts,js
  "protolint",
  -- "yamlfix",                     -- yml
  -- "phpcs",
  -- "php-cbf",
  -- "php-cs-fixer",
}

function M.config()
  require("mason").setup {
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, M.mason_servers)
    end,
    ui = {
      border = "rounded",
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌 ",
      },
    },
  }
  require("mason-lspconfig").setup {
    automatic_installation = true,
    ensure_installed = M.mason_lspconfig_servers,
  }

  require("mason-null-ls").setup {
    automatic_installation = true,
    ensure_installed = M.mason_null_ls_servers,
  }
end

return M

-- NOTE: astro-ls stopped working, neovim gets crashed
-- This is temporary fix, clone the following repo somewhere and install parser
-- https://github.com/virchau13/tree-sitter-astro
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.astro.install_info.url = "~/.local/share/nvim/mason/packages/tree-sitter-astro"
