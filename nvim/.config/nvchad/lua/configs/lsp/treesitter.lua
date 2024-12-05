return {
  ensure_installed = {
    "astro",
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "go",
    "javascript",
    "json",
    "toml",
    "markdown",
    "bash",
    "lua",
    "tsx",
    "typescript",
  },
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
