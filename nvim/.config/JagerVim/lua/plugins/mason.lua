local M = {
  'williamboman/mason.nvim',
  event = 'VeryLazy',
  dependencies = {
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'b0o/SchemaStore.nvim',
    'onsails/lspkind-nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'jay-babu/mason-null-ls.nvim',
    'nvimtools/none-ls.nvim',
  },
  cmd = {
    'Mason',
    'MasonLog',
    'MasonUpdate',
    'MasonInstall',
    'MasonUninstall',
    'MasonUninstallAll',
  },
}

M.servers = {
  lsp = {
    'lua_ls',
    'stylua',
    'biome',
    'bashls',
    'buf_ls',
    'clangd',
    'taplo',
    'pyright',
    'sqls',
    'yamlls',
    'jsonls',
    'dockerls',
    'docker_compose_language_service',
    'marksman',
    'emmet_ls',
    'html',
    'cssls',
    'cssmodules_ls',
    'ts_ls',
    'tailwindcss',
    'astro',
    'gopls',
    'golangci_lint_ls',
  },
  linters = {
    'mypy',
    'hadolint',
    'markdownlint',
    'eslint_d',
    'protolint',
    'gospel',
    'golangci-lint',
  },
  formatters = {
    'black',
    'prettierd',
    'shfmt',
    'kdlfmt',
    'sqlfmt',
    'jq',
    'prettierd',
    'fixjson',
    'goimports_reviser',
    'gofumpt',
    'golines',
  },
  complier = {
    'tree-sitter-cli',
  },
}

function M.config()
  require('lspkind').setup()
  local flat = require('globals.utils').flattable
  local servers = flat(M.servers.formatters, M.servers.lsp, M.servers.linters, M.servers.complier)

  require('mason').setup {
    opts = {
      automatic_installation = true,
      ensure_installed = servers,
    },
    ui = {
      border = 'rounded',
      icons = {
        package_pending = ' ',
        package_installed = '󰄳 ',
        package_uninstalled = ' 󰚌 ',
      },
    },
  }

  require('mason-lspconfig').setup {
    automatic_enable = true,
    automatic_installation = true,
    ensure_installed = M.servers.lsp,
  }

  require('mason-null-ls').setup {
    automatic_installation = true,
    ensure_installed = servers,
  }

  vim.lsp.enable(servers)

  vim.api.nvim_create_user_command('MasonInstallAll', function()
    local servers_str = table.concat(servers, ' ')
    vim.cmd('MasonInstall ' .. servers_str)
  end, {})
end

return M
