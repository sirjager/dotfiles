local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

vim.filetype.add { extension = { mdx = "mdx" } }
vim.treesitter.language.register("markdown", "mdx")
vim.filetype.add({ extension = { astro = "astro" } })

ts.setup {
  ensure_installed = {
    "bash", "lua", "html", "dart",
    "yaml", "json", "css", "tsx", "markdown",
    "markdown_inline",
  },

  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  -- Install parsers syncronously (only applicable to `ensure_installed`)
  sync_install = false,
  auto_install = true, -- auto installs treesitter for new languages discovered

  playground = { enable = true },

  markid = { enable = true },

  indent = { enable = true, disable = { "yaml", "python", "yml" } },

  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,
    disable = function(lang, buf)
      if vim.tbl_contains({ "latex" }, lang) then
        return true
      end

      local status_ok, big_file_detected = pcall(vim.api.nvim_buf_get_var, buf, "bigfile_disable_treesitter")
      return status_ok and big_file_detected
    end,
  },


  autotag = {
    enable = true,
  },

  refactor = {
    highlight_current_scope = {
      enable = true,
    },

    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true, -- Set to false if you have an `updatetime` of ~101.
    },

    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gcr",
      },
    },

    navigation = {
      enable = true,
      -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A->",
        goto_previous_usage = "<A-<",
      },
    },

    indent = {
      enable = true,
      disable = {
        "yaml",
        "yml",
        "python",
      },
    },
  },

  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
    },
  },
}
