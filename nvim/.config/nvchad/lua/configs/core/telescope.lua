return {
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
      "--glob=!.git/**",
    },
    extensions_list = { "themes", "media_files", "projects", "terms", "fzf" },
  },
  file_sorter = require("telescope.sorters").get_fuzzy_file,
  file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor/", "^.venv/" },
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
      -- theme = "dropdown",
      -- previewer = true,
    },
    find_files = {
      prompt_title = "Find files",
      prompt_prefix = "   ",
      theme = "dropdown",
      previewer = false,
    },
    live_grep = {
      prompt_title = "Live grep",
      prompt_prefix = "   ",
    },
    help_tags = {
      prompt_title = "Help tags",
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
      theme = "dropdown",
    },

    buffers = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_references = {
      initial_mode = "normal",
    },
    lsp_definitions = {
      initial_mode = "normal",
    },

    lsp_declarations = {
      initial_mode = "normal",
    },

    lsp_implementations = {
      initial_mode = "normal",
    },
  },
  extensions_list = { "themes", "media_files", "projects", "terms", "fzf" },
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown() },
    emoji = {
      action = function(emoji)
        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
        vim.api.nvim_put({ emoji.value }, "c", false, true)
      end,
    },
    projects = {
      base_dirs = {},
      display_type = "full",
      hidden_files = false, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    media_files = {
      filetypes = {
        "png",
        "webp",
        "jpg",
        "jpeg",
      },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },

}
