return {
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
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
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
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 2000
    end,
    opts = require "configs.core.which-key",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      extensions_list = { "themes", "terms", "zoxide", "project", "emoji", "ui-select", "media_files" },
    },
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
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    opts = require "configs.lsp.lspsaga",
    event = "VeryLazy",
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end
  },
  {
    "epwalsh/obsidian.nvim",
    ft = { "markdown" },
    version = "*",
  },
  {
    "shellRaining/hlchunk.nvim",
    opts = require "configs.xtra.hlchunk",
    event = "BufReadPost",
    config = function(_, opts)
      require "hlchunk".setup(opts)
    end
  }
}
