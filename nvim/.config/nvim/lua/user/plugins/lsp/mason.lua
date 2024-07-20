local masonok, mason = pcall(require, "mason")
if masonok then
  mason.setup {
    PATH = "prepend",
    max_concurrent_installers = 10,
    ui = {
      border = "rounded",
      width = 0.8,
      height = 0.9,
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌 ",
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },
  }
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if mason_lspconfig_ok then
  mason_lspconfig.setup {
    automatic_installation = false,
    ensure_installed = {
      "bashls", -- sh
      "clangd",
      "cssls",
      -- "prismals",
      -- "eslint", -- ts,js
      "emmet_ls",
      "gopls",    -- go
      "golangci_lint_ls",
      "html",     -- html
      "jsonls",   -- json
      "lua_ls",   -- lua
      -- "marksman", -- md
      "tsserver", -- ts
      "tailwindcss",
      "cssmodules_ls",
      -- "pylsp",
      -- "pyright", -- py
      "yamlls", -- yml
      -- "sqlls",
      -- "phpactor", -- php
      --[[ "intelephense", -- php ]]
    },
  }
end

local mason_null_ls_ok, mason_null_ls = pcall(require, "mason-null-ls")
if mason_null_ls_ok then
  mason_null_ls.setup {
    automatic_installation = false,
    ensure_installed = {
      -- @astrojs/language-server@2.6.3 -- working -- latest is broken
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
      "gofumpt",  -- go
      -- "mypy", -- py
      "codespell",
      -- "yamllint", -- yml
      -- "ruff", -- py
      -- "rustywind",
      -- "shellharden", -- sh
      "shellcheck",
      "jq",
      -- "shfmt",
      -- "sqlfmt",
      -- "sql-formatter",
      "fixjson",
      "golangci-lint",
      "gospel",
      "gofumpt",
      "goimports_reviser",               -- go
      -- "golines",                         -- go
      "lua-language-server",             -- lua
      -- "svelte-language-server",          -- lua
      "docker-compose-language-service", -- docker-compose.yaml
      "dockerfile-language-server",      -- Dockerfile
      -- "markdownlint",                    -- md
      -- "mdx_analyzer",
      "prettierd",                   -- ts, js
      -- "rust-analyzer", -- rust
      "stylua",                      -- lua
      "typescript-languange-server", -- ts,js
      "protolint",
      -- "yamlfix",                     -- yml
      -- "phpcs",
      -- "php-cbf",
      -- "php-cs-fixer",
    },
  }
end

local neodevok, neodev = pcall(require, "neodev")
if neodevok then
  neodev.setup {}
end


-- -- NOTE: astro-ls stopped working, neovim gets crashed
-- -- This is temporary fix, clone the following repo somewhere and install parser
-- -- https://github.com/virchau13/tree-sitter-astro
-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.astro.install_info.url = "~/.local/share/nvim/mason/packages/tree-sitter-astro"
