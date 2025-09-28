local M = {
  "williamboman/mason.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = {
    "Mason",
    "MasonLog",
    "MasonUpdate",
    "MasonInstall",
    "MasonUninstall",
    "MasonUninstallAll",
  },
}

M.servers = {
  --
  "shfmt",
  "shellcheck",

  --
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

  --
  -- "zls", -- zig

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

function M.config()
  require("mason").setup({
    opts = {
      automatic_installation = true,
      ensure_installed = M.servers,
    },
    ui = {
      border = "rounded",
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌 ",
      },
    },
  })
end

return M
