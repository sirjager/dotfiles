local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  build = ":TSUpdate",
}

M.servers = {
  "bash",
  "jq",
  "lua",
  "html",
  "markdown",
  "markdown_inline",
}

function M.config()
  vim.filetype.add { extension = { mdx = "mdx" } }
  vim.treesitter.language.register("markdown", "mdx")
  vim.filetype.add { extension = { astro = "astro" } }
  require("nvim-treesitter.configs").setup {

    ensure_installed = M.servers,
    sync_install = false,
    auto_install = true,

    markid = { enable = true },
    playground = { enable = false },
    matchup = { enable = true, disable = { "c", "ruby", "rust" } },
    indent = { enable = true, disable = { "yaml", "python", "yml" } },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      disable = function(lang, buf)
        if vim.tbl_contains({ "latex", "tex" }, lang) then
          return true
        end
        local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, "bigfile_disable_treesitter")
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
      indent = { enable = true, disable = { "yaml", "yml", "python" } },
    },

    textobjects = {
      select = { enable = true, lookahead = true },
    },
  }

  require("treesitter-context").setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    -- line_numbers = true,
    multiline_threshold = 1, -- 20, -- Maximum number of lines to show for a single context
    trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 1, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  }
end

return M
