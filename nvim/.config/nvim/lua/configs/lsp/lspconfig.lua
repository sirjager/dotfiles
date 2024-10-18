-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "astro",
  "bashls",
  "bufls",
  "html",
  "cssls",
  "cssmodules_ls",
  "dockerls",
  "docker_compose_language_service",
  "emmet_ls",
  "gopls",
  "graphql",
  "jsonls",
  "sqlls",
  "ts_ls",
  "tailwindcss",
  "yamlls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  local opts = { on_attach = nvlsp.on_attach, capabilities = nvlsp.capabilities, on_init = nvlsp.on_init }
  local okreq, custom_opts = pcall(require, "configs.lsp.servers." .. lsp)
  if okreq then
    opts = vim.tbl_deep_extend("force", custom_opts, opts)
  end
  lspconfig[lsp].setup(opts)
end
