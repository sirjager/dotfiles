return {
  {
    "vhyrro/luarocks.nvim",
    lazy = false,
    priority = 1000,
    opts = { rocks = { "magick" } },
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 999,
    config = function()
      require "configs.xtra.notify"
    end
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.lsp.conform",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.core.nvim-tree",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lsp.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.lsp.treesitter",
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = require "configs.lsp.mason",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = require "configs.lsp.mason-lspconfig",
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = require "configs.xtra.zenmode",
  },
  {
    "declancm/maximize.nvim",
    lazy = false,
    config = function()
      require("maximize").setup()
    end,
  },
  {
    "jcdickinson/codeium.nvim",
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-path",                      event = "InsertEnter" },
      { "hrsh7th/cmp-buffer",                    event = "InsertEnter" },
      { "hrsh7th/cmp-buffer",                    event = "InsertEnter" },
      { "hrsh7th/cmp-nvim-lua",                  event = "InsertEnter" },
      { "hrsh7th/cmp-cmdline",                   event = "CmdlineEnter" },
      { "hrsh7th/cmp-nvim-lsp",                  event = "InsertEnter" },
      { "saadparwaiz1/cmp_luasnip",              event = "InsertEnter" },
      { "andersevenrud/cmp-tmux",                event = "InsertEnter" },
      { "hrsh7th/cmp-emoji",                     event = "InsertEnter" },
      { "L3MON4D3/LuaSnip",                      event = "InsertEnter" },
      { "rafamadriz/friendly-snippets" },
      { "onsails/lspkind-nvim" },
      { "hrsh7th/cmp-nvim-lua" },
      { "roobert/tailwindcss-colorizer-cmp.nvim" },
    },
    config = function()
      require "configs.lsp.cmp"
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    priority = 999,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 2000
    end,
    opts = require "configs.core.which-key",
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "UIEnter",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = require "configs.core.telescope",
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.load_extension "media_files"
      telescope.load_extension "emoji"
      telescope.load_extension "ui-select"
      require("telescope").setup(opts)
    end
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "kevinhwang91/promise-async" },
    },
    opts = require "configs.lsp.ufo",
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    lazy = false,
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    lazy = false,
    priority = 999,
    opts = require "configs.lsp.lspsaga",
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end
  },
  {
    "epwalsh/obsidian.nvim",
    ft = { "markdown" },
    version = "*",
    opts = require "configs.xtra.obsidian",
    config = function(_, opts)
      require("obsidian").setup(opts)
    end
  },
  {
    "shellRaining/hlchunk.nvim",
    opts = require "configs.xtra.hlchunk",
    event = "BufReadPost",
    config = function(_, opts)
      require "hlchunk".setup(opts)
    end
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      { "folke/todo-comments.nvim" },
      { "JoosepAlviste/nvim-ts-context-commentstring" },
    },
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
      local comments = require "configs.lsp.comments"
      require("ts_context_commentstring").setup(comments.comment_string_opts)
      require("todo-comments").setup(comments.todo_comments_opts)
      local hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup(comments.comment_opts(hook))
    end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      local opts = require "configs.core.noice"
      require "noice".setup(opts)
    end
  },
  {
    "karb94/neoscroll.nvim",
    opts = require "configs.xtra.neoscroll",
    config = function(_, opts)
      require "neoscroll".setup(opts)
    end
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
      "akinsho/pubspec-assist.nvim",
      "wa11breaker/flutter-bloc.nvim"
    },
    opts = require "configs.lsp.flutter",
    config = function(_, opts)
      require("flutter-tools").setup(opts)
      require("pubspec-assist").setup({})
    end
  },
  {
    "HakonHarnes/img-clip.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = require 'configs.xtra.img-clip',
    config = function(_, opts)
      require 'img-clip'.setup(opts)
    end
  },
  {
    "3rd/image.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = require "configs.xtra.image",
    config = function(_, opts)
      require('image').setup(opts)
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = require 'configs.xtra.colorizer',
    config = function(_, opts)
      require "colorizer".setup(opts)
    end
  },
  { "ThePrimeagen/harpoon" },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "gbprod/none-ls-shellcheck.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      local opts = require('configs.lsp.none_ls').opts(null_ls);
      null_ls.setup(opts)
    end
  },
  {
    "jayp0521/mason-null-ls.nvim",
    opts = require "configs.lsp.mason_null_ls",
    config = function(_, opts)
      require("mason-null-ls").setup(opts)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = require('configs.lsp.mason-lspconfig'),
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)
    end
  }

}
