local M = {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  lazy = false,
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter-context"
  },
}

local servers = {
  'diff',
  'bash',
  'jq',
  'lua',
  'html',
  -- "latex",
  'typst',
  'yaml',
  'markdown',
  'markdown_inline',
  'typescript',
  'tsx',
  'javascript',
  'json',
  'css',
  'scss',
  'astro',
  'rasi',
  'vim',
  'vimdoc',
  'regex',
  'go',
  'python',
}

M.opts = {
  ensure_installed = servers,
  sync_install = false,
  auto_install = true,
  markid = { enable = true },
  playground = { enable = false },
  matchup = { enable = true, disable = { 'c', 'ruby', 'rust' } },
  indent = { enable = true, disable = { 'yaml', 'python', 'yml' } },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
    disable = function(lang, buf)
      if vim.tbl_contains({ 'latex', 'tex' }, lang) then
        return true
      end
      local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, 'bigfile_disable_treesitter')
      return status_ok and big_file_detected
    end,
  },

  refactor = {
    highlight_current_scope = {
      enable = true,
    },
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~101.
    },
    smart_rename = { enable = true },
    navigation = { enable = true },
    indent = { enable = true, disable = { 'yaml', 'yml', 'python' } },
  },

  textobjects = {
    select = { enable = true, lookahead = true },
  },
}

function M.config(_, opts)
  vim.filetype.add { extension = { rasi = 'rasi' } }
  vim.treesitter.language.register('css', 'rasi')
  vim.filetype.add { extension = { mdx = 'mdx' } }
  vim.treesitter.language.register('markdown', 'mdx')
  vim.filetype.add { extension = { astro = 'astro' } }
  require('nvim-treesitter.configs').setup(opts)
  -- require'treesitter-context'.setup{}
end

return M
