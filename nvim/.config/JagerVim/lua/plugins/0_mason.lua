vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
  { src = "https://github.com/b0o/SchemaStore.nvim" },
  { src = "nvim-lua/plenary.nvim" },
  { src = "glepnir/lspsaga.nvim", version = "main" },
  { src = "windwp/nvim-ts-autotag" },
})

local servers = {
  --
  "shfmt",
  "shellcheck",
  --
  "taplo", -- toml
  "buf",
  "luacheck",
  "stylua",
  "lua-language-server",
  "bash-language-server",
  --
  "marksman",
  "markdownlint",
  --
  "json-lsp",
  "hadolint",
  "dockerfile-language-server",
  "docker-compose-language-service",
  --
  "yaml-language-server",
  "tree-sitter-cli",
  --
  "sqlfmt",
  "sqlls",
  --
  "emmet-ls",
  "html-lsp",
  "css-lsp",
  "prettierd",
  "cssmodules-language-server",
  "typescript-language-server",
  "tailwindcss-language-server",
  -- python
  "pyright", -- lsp
  "debugpy", -- debug
  "mypy", -- diagnostic
  "black", -- formatter
  -- rust
  -- "ruff-lsp",
  -- astro
  "astro-language-server", -- working fine | needs manual installed
  -- "astro-language-server@2.10.0" -- working fine | needs manual installed
}

require("mason").setup()
require("mason-lspconfig").setup()
require("lspsaga").setup()
require("nvim-ts-autotag").setup()
require("mason-tool-installer").setup({ ensure_installed = servers })

vim.lsp.enable(servers)
