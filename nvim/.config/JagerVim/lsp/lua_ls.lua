return {
  filetypes = { 'lua' },
  root_markers = { '.stylua.toml', { '.luarc.json', '.luarc.jsonc' }, '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = vim.list_extend(vim.api.nvim_get_runtime_file('', true), {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        }),
      },
      hint = {
        enable = false,
        arrayIndex = 'Disable', -- "Enable" | "Auto" | "Disable"
        await = true,
        paramName = 'Disable', -- "All" | "Literal" | "Disable"
        paramType = true,
        semicolon = 'All', -- "All" | "SameLine" | "Disable"
        setType = false,
      },
      telemetry = {
        enable = false,
      },
      doc = {
        privateName = { '^_' },
      },
      type = {
        castNumberToInteger = true,
      },
      diagnostics = {
        globals = { 'vim', 'require', 'spec', 'bit', 'it', 'describe', 'before_each', 'after_each' },
        unusedLocalExclude = { '_*' },
        disable = {
          'incomplete-signature-doc',
          'trailing-space',
          'no-unknown',
        },
        groupSeverity = {
          strong = 'Warning',
          strict = 'Warning',
        },
        groupFileStatus = {
          ['ambiguity'] = 'Opened',
          ['await'] = 'Opened',
          ['codestyle'] = 'None',
          ['duplicate'] = 'Opened',
          ['global'] = 'Opened',
          ['luadoc'] = 'Opened',
          ['redefined'] = 'Opened',
          ['strict'] = 'Opened',
          ['strong'] = 'Opened',
          ['type-check'] = 'Opened',
          ['unbalanced'] = 'Opened',
          ['unused'] = 'Opened',
        },
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
          continuation_indent_size = '2',
        },
      },
    },
  },
}
