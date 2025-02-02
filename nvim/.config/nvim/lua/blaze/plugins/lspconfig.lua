local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "onsails/lspkind-nvim",
  },
}

M.servers = {
  --
  "bashls",

  --
  "lua_ls",

  --
  "dockerls",
  "docker_compose_language_service",

  --
  "buf_ls",
  "sqlls",
  "jsonls",
  "yamlls",
  "graphql",

  --
  "html",
  "cssls",
  "emmet_ls",
  "cssmodules_ls",
  --
  "ts_ls",
  "astro",
  "tailwindcss",
  -- "biome",

  --
  "gopls",

  --
  -- "pyright",
  -- "ruff",
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
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

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
  local icons = require "blaze.icons"

  vim.treesitter.language.register("markdown", "vimwiki")

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
    virtual_text = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      -- border = "rounded",
      border = {
        { "󱐋", "WarningMsg" },
        { "─", "Comment" },
        { "╮", "Comment" },
        { "│", "Comment" },
        { "╯", "Comment" },
        { "─", "Comment" },
        { "╰", "Comment" },
        { "│", "Comment" },
      },
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

  for _, server in pairs(M.servers) do
    local opts = { on_attach = M.on_attach, capabilities = M.common_capabilities() }
    local okreq, settings = pcall(require, "blaze.plugins.servers." .. server)
    if okreq then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    lspconfig[server].setup(opts)
  end

  -- This line disables diagnostic globally; if anyone needs it here it is
  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
end

return M
