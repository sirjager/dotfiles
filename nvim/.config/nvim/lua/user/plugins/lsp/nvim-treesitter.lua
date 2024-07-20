local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

vim.filetype.add { extension = { mdx = "mdx" } }
vim.treesitter.language.register("markdown", "mdx")
vim.filetype.add({ extension = { astro = "astro" } })

ts.setup {
  ensure_installed = { "lua", "markdown", "markdown_inline" },
  matchup = {
    enable = true,
    disable = { "c", "ruby", }
  },

  sync_install = false,
  auto_install = true,

  playground = { enable = false },

  markid = { enable = true },

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
