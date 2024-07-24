local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "onsails/lspkind-nvim",
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.foldingRange = { dynamicRegistration = false, lineFoldingOnly = true }
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, { bufnr })
end

function M.config()
  local lspconfig = require "lspconfig"
  local icons = require "dope.icons"

  local servers = {
    "bashls",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "html",
    "emmet_ls",
    "tsserver",
    "bufls",
    "astro",
    "lua_ls",
    "graphql",
    "sqlls",
    "dockerls",
    "docker_compose_language_service",
    "jsonls",
    "yamlls",
    "gopls",
    "marksman",
    "tailwindcss",
    "phpactor",
    "intelephense",
  }

  local default_diagonastic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
      },
    },
    underline = true,
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagonastic_config)
  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config() or {}, "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = { on_attach = M.on_attach, capabilities = M.common_capabilities() }
    local okreq, settings = pcall(require, "dope.lsps.servers." .. server)
    if okreq then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end
    lspconfig[server].setup(opts)
  end

  -- end m.config
end

return M
