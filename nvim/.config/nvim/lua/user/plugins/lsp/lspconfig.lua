local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

local util = require "lspconfig/util"

-- enable autocompletion capabilities
local capabilities = cmp_nvim_lsp.default_capabilities()


-- ufo: code folding
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
-- enable keybinds for available lsp servers
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- vim.api.nvim_set_option_value(bufnr or 0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- Lua
lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}

-- css
lspconfig.svelte.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


-- protobuff
lspconfig.bufls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


-- css
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


lspconfig.cssmodules_ls.setup {
  capabilities = capabilities,
  on_attach = function(client)
    client.server_capabilities.definitionProvider = false
    on_attach(client)
  end,
  init_options = {
    camelCase = "dashes",
  },
}

lspconfig.terraformls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}


lspconfig.graphql.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- jsonls
lspconfig.sqlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- jsonls
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.prismals.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "Dockerfile" },
}

lspconfig.docker_compose_language_service.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "docker-compose.yaml", "docker-compose.yml" },
}

-- -- Flutter
-- local okf, flutter = pcall(require, "flutter")
-- if okf then
--   flutter.setup {}
-- end

-- emmet ls
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetype = { "html", "astro", "typescript", "typescriptreact", "javascript", "javascriptreact", "ts", "tsx" },
}

-- astro
lspconfig.astro.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetype = { "astro" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "astro.config.mjs"),
}


-- typescript
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
  },
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    perferences = {
      -- https://github.com/microsoft/TypeScript/blob/3b45f4db12bbae97d10f62ec0e2d94858252c5ab/src/server/protocol.ts#L3439
      disableSuggestions = false,
      quotePreference = "double",
    },
  },
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "astro", "astro-markdown", "html", "css",
    "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", },
}


lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  yaml = {
    schemastore = {
      enable = false,
      url = "",
    },
    validate = { enable = false },
    schemas = require("schemastore").yaml.schemas({
      extra = {
        {
          description = 'Taskfile schema',
          fileMatch = 'Taskfile.yaml',
          name = 'Taskfile.yaml',
          url = 'https://taskfile.dev/schema.json',
        },
      }
    }),
  },
}
