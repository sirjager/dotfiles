local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

local ok2, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok2 then
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
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
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

lspconfig.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  yaml = {
    schemastore = {
      -- You must disable built-in schemaStore support if you want to use
      -- this plugin and its advanced options like `ignore`.
      enable = false,
      -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      url = "",
    },
    -- schemas = require("schemastore").yaml.schemas(),
    schemas = {
      ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
      ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
      ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
      ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
      ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
      ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}',
      ['https://taskfile.dev/schema.json'] = '**/Taskfile.{yml,yaml}'
    }
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

-- lspconfig.phpactor.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
-- }

-- -- Flutter
-- local okf, flutter = pcall(require, "flutter")
-- if okf then
--   flutter.setup {}
-- end

--[[ -- emmet ]]
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
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
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
      disableSuggestions = true,
    },
  },
}

-- tailwindcss
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "astro",
    "astro-markdown",
    "html",
    "markdown",
    "mdx",
    "css",
    "less",
    "postcss",
    "sass",
    "scss",
    "stylus",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
}

-- markdown
lspconfig.marksman.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "markdown", "markdown.mdx", "mdx" },
}

-- mdx
lspconfig.mdx_analyzer.setup {
  cmd = { "mdx-language-server", "--stdio" },
  filetypes = { "markdown.mdx", "mdx" },
}

-- -- python pyright
-- lspconfig.pyright.setup {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetype = { "python" },
-- }

-- -- rust tools
-- local ok4, rust_tools = pcall(require, "rust-tools")
-- if ok4 then
--   rust_tools.setup {
--     server = {
--       capabilities = capabilities,
--       on_attach = function(_, bufnr)
--         vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--         vim.keymap.set("n", "<leader>ldd", ":RustDebuggables <CR>", { buffer = bufnr })
--         vim.keymap.set("n", "<leader>lh", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
--         vim.keymap.set("n", "<leader>la", ":CodeActionMenu<CR>", { buffer = bufnr })
--         --[[ vim.keymap.set("n", "<leader>la", rust_tools.code_action_group.code_action_group, { buffer = bufnr }) ]]
--       end,
--     },
--     tools = {
--       hover_actions = {
--         auto_focus = true,
--       },
--     },
--   }
-- end


-- NOTE: GO LANG SPECIFIC

-- configure gopls server
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go" },
  root_dir = util.root_pattern("go.work", "go.mod", "go.sum", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      staticcheck = true,
      hoverKind = "FullDocumentation",
      linkTarget = "pkg.go.dev",
      usePlaceholders = false,
      vulncheck = "Imports",
      analyses = {
        unmarshal = true,
        unsafeptr = true,
        unusedparams = true,
        unusedvariable = true,
      },
    },
  },
}

-- code folding
local okufo, ufo = pcall(require, "ufo")
if okufo then
  ufo.setup {
    ---@diagnostic disable-next-line: unused-local
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  }
end
