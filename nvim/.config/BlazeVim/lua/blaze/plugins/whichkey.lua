local M = {
  "folke/which-key.nvim",
  -- keys = { "<leader>" }, -- lazy load using key
  event = "VeryLazy", -- 
}

M.opts = {
  spec = require "blaze.whichkeys",
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = " ",
    ellipsis = "...",
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󱞦 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󱞦 ",
      BS = "󰁮 ",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫 ",
      F2 = "󱊬 ",
      F3 = "󱊭 ",
      F4 = "󱊮 ",
      F5 = "󱊯 ",
      F6 = "󱊰 ",
      F7 = "󱊱 ",
      F8 = "󱊲 ",
      F9 = "󱊳 ",
      F10 = "󱊴 ",
      F11 = "󱊵 ",
      F12 = "󱊶 ",
    },
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  win = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- single | double | shadow etc.
    wo = {
      winblend = 0,
    },
  },
}

return M
