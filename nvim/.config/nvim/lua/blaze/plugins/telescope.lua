local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {},
}

function M.config()
  local telescope = require "telescope"

  local flutterInstalled, _ = pcall(require, "flutter")
  if flutterInstalled then
    telescope.load_extension "flutter"
  end

  local actions = require "telescope.actions"

  telescope.setup {
    defaults = {
      initial_mode = "insert",
      selection_strategy = "reset",
      -- path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        -- "--glob='!.git/**'",
      },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    winblend = 0,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    pickers = {
      oldfiles = {
        prompt_title = "Recent files",
        prompt_prefix = "   ",
        -- theme = "ivy", -- dropdown | ivy |
        previewer = true,
      },
      find_files = {
        prompt_title = "Find files",
        prompt_prefix = "   ",
        -- theme = "ivy",
        previewer = true,
      },
      live_grep = {
        prompt_title = "Live grep",
        prompt_prefix = "   ",
        previewer = true,
      },
      help_tags = {
        prompt_title = "Help tags",
        theme = "ivy",
        prompt_prefix = " 󰘥  ",
      },
      colorscheme = {
        prompt_title = "Color schemes",
        prompt_prefix = "   ",
        enable_preview = true,
      },
      keymaps = {
        prompt_title = "Key bindings",
        prompt_prefix = " 󰌓  ",
        theme = "ivy",
      },

      buffers = {
        theme = "dropdown",
        initial_mode = "normal",
        mappings = { i = { ["<C-d>"] = actions.delete_buffer }, n = { ["dd"] = actions.delete_buffer } },
      },

      lsp_references = { initial_mode = "normal" },
      lsp_definitions = { initial_mode = "normal" },
      lsp_declarations = { initial_mode = "normal" },
      lsp_implementations = { initial_mode = "normal" },
    },
    mappings = {
      i = {
        ["<C-_>"] = actions.which_key,
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
      },
      n = {
        ["q"] = actions.close,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["?"] = actions.which_key,
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<C-k>"] = actions.preview_scrolling_up,
      },
    },

    extensions_list = { "themes", "fzf" },
    extensions = {
      ["ui-select"] = { require("telescope.themes").get_dropdown() },
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }
end

return M
