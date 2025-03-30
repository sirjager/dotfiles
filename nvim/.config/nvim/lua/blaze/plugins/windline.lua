local M = {
  "windwp/windline.nvim",
  event = "BufReadPost",
}

local last_macro = ""

function M.config()
  local windline = require "windline"
  local helper = require "windline.helpers"
  local b_components = require "windline.components.basic"
  local state = _G.WindLine.state

  local lsp_comps = require "windline.components.lsp"
  local git_comps = require "windline.components.git"

  local hl_list = {
    Black = { "white", "black" },
    White = { "black", "white" },
    Inactive = { "InactiveFg", "InactiveBg" },
    Active = { "ActiveFg", "ActiveBg" },
  }
  local basic = {}

  local breakpoint_width = 90
  basic.divider = { b_components.divider, "" }
  basic.bg = { "", "StatusLine" }

  local colors_mode = {
    Normal = { "purple", "black" },
    Insert = { "green", "black" },
    Visual = { "yellow", "black" },
    Replace = { "blue_light", "black" },
    Command = { "magenta", "black" },
  }

  basic.vi_mode = {
    name = "vi_mode",
    hl_colors = colors_mode,
    text = function()
      return { { "  ", state.mode[2] } }
    end,
  }

  basic.macros = {
    name = "macros",
    hl_colors = {
      red = { "red", "black" },
      yellow = { "yellow", "black" },
    },
    text = function()
      local rec = vim.fn.reg_recording()
      if rec ~= "" then
        last_macro = rec -- Store last recorded macro
        return { { "   RECORDING MACRO @" .. rec .. " ", "red" } }
      elseif last_macro ~= "" then
        -- Show last macro executed for 5 seconds
        vim.defer_fn(function()
          last_macro = ""
        end, 10000) -- seconds in ms
        return { { "   RECORDED Macro: @" .. last_macro .. " ", "yellow" } }
      end
      return { { "", "" } }
    end,
  }

  basic.square_mode = {
    hl_colors = colors_mode,
    text = function()
      return { { "▊", state.mode[2] } }
    end,
  }

  basic.lsp_diagnos = {
    name = "diagnostic",
    hl_colors = {
      red = { "red", "black" },
      yellow = { "yellow", "black" },
      blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { lsp_comps.lsp_error { format = "  %s", show_zero = true }, "red" },
          { lsp_comps.lsp_warning { format = "  %s", show_zero = true }, "yellow" },
          { lsp_comps.lsp_hint { format = "  %s", show_zero = true }, "blue" },
        }
      end
      return ""
    end,
  }
  basic.file = {
    name = "file",
    hl_colors = {
      default = hl_list.Black,
      white = { "white", "black" },
      magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
      if width > breakpoint_width then
        return {
          { b_components.cache_file_size(), "default" },
          { " ", "" },
          { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
          { b_components.line_col_lua, "white" },
          { b_components.progress_lua, "" },
          { " ", "" },
          { b_components.file_modified " ", "magenta" },
        }
      else
        return {
          { b_components.cache_file_size(), "default" },
          { " ", "" },
          { b_components.cache_file_name("[No Name]", "unique"), "magenta" },
          { " ", "" },
          { b_components.file_modified " ", "magenta" },
        }
      end
    end,
  }
  basic.file_right = {
    hl_colors = {
      default = hl_list.Black,
      white = { "white", "black" },
      magenta = { "magenta", "black" },
    },
    text = function(_, _, width)
      if width < breakpoint_width then
        return {
          { b_components.line_col_lua, "white" },
          { b_components.progress_lua, "" },
        }
      end
    end,
  }
  basic.git = {
    name = "git",
    hl_colors = {
      green = { "green", "black" },
      red = { "red", "black" },
      blue = { "blue", "black" },
    },
    width = breakpoint_width,
    text = function(bufnr)
      if git_comps.is_git(bufnr) then
        return {
          { git_comps.diff_added { format = "  %s", show_zero = true }, "green" },
          { git_comps.diff_changed { format = "  %s", show_zero = true }, "blue" },
          { git_comps.diff_removed { format = "  %s", show_zero = true }, "red" },
        }
      end
      return ""
    end,
  }

  local quickfix = {
    filetypes = { "qf", "Trouble" },
    active = {
      { "🚦 Quickfix ", { "white", "black" } },
      { helper.separators.slant_right, { "black", "black_light" } },
      {
        function()
          return vim.fn.getqflist({ title = 0 }).title
        end,
        { "cyan", "black_light" },
      },
      { " Total : %L ", { "cyan", "black_light" } },
      { helper.separators.slant_right, { "black_light", "InactiveBg" } },
      { " ", { "InactiveFg", "InactiveBg" } },
      basic.divider,
      { helper.separators.slant_right, { "InactiveBg", "black" } },
      { "🧛 ", { "white", "black" } },
    },

    always_active = true,
    show_last_status = true,
  }

  local explorer = {
    filetypes = { "fern", "NvimTree", "lir" },
    active = {
      { "  ", { "black", "purple" } },
      { helper.separators.slant_right, { "purple", "NormalBg" } },
      { b_components.divider, "" },
      { b_components.file_name "", { "white", "NormalBg" } },
    },
    always_active = true,
    show_last_status = true,
  }

  basic.lsp_name = {
    width = breakpoint_width,
    name = "lsp_name",
    hl_colors = {
      magenta = { "magenta", "black" },
    },
    text = function(bufnr)
      if lsp_comps.check_lsp(bufnr) then
        return {
          { lsp_comps.lsp_name(), "magenta" },
        }
      end
      return {
        { b_components.cache_file_type { icon = true }, "magenta" },
      }
    end,
  }

  local default = {
    filetypes = { "default" },
    active = {
      basic.square_mode,
      basic.vi_mode,
      basic.file,
      basic.lsp_diagnos,
      basic.divider,
      basic.macros,
      basic.file_right,
      basic.lsp_name,
      basic.git,
      { git_comps.git_branch(), { "magenta", "black" }, breakpoint_width },
      { " ", hl_list.Black },
      basic.square_mode,
    },
    inactive = {
      { b_components.full_file_name, hl_list.Inactive },
      basic.file_name_inactive,
      basic.divider,
      basic.divider,
      { b_components.line_col, hl_list.Inactive },
      { b_components.progress, hl_list.Inactive },
    },
  }

  --[[ -- sample ]]
  --[[ ---@diagnostic disable-next-line: unused-local ]]
  --[[ local colors = { ]]
  --[[ 	black = "", -- terminal_color_0, ]]
  --[[ 	red = "", -- terminal_color_1, ]]
  --[[ 	green = "", -- terminal_color_2, ]]
  --[[ 	yellow = "", -- terminal_color_3, ]]
  --[[ 	blue = "", -- terminal_color_4, ]]
  --[[ 	magenta = "", -- terminal_color_5, ]]
  --[[ 	cyan = "", -- terminal_color_6, ]]
  --[[ 	white = "", -- terminal_color_7, ]]
  --[[ 	black_light = "", -- terminal_color_8, ]]
  --[[ 	red_light = "", -- terminal_color_9, ]]
  --[[ 	green_light = "", -- terminal_color_10, ]]
  --[[ 	yellow_light = "", -- terminal_color_11, ]]
  --[[ 	blue_light = "", -- terminal_color_12, ]]
  --[[ 	magenta_light = "", -- terminal_color_13, ]]
  --[[ 	cyan_light = "", -- terminal_color_14, ]]
  --[[ 	white_light = "", -- terminal_color_15, ]]
  --[[ 	NormalFg = "", -- hightlight Normal fg ]]
  --[[ 	NormalBg = "", -- hightlight Normal bg ]]
  --[[ 	ActiveFg = "", -- hightlight StatusLine fg ]]
  --[[ 	ActiveBg = "", -- hightlight StatusLine bg ]]
  --[[ 	InactiveFg = "", -- hightlight StatusLineNc fg ]]
  --[[ 	InactiveBg = "", -- hightlight StatusLineNc bg ]]
  --[[ } ]]

  windline.setup {
    statuslines = {
      default,
      quickfix,
      explorer,
    },
    -- this function will run on ColorScheme autocmd
    colors_name = function(colors)
      colors.white = "#CDD6F4"
      colors.red = "#F38BA8"
      colors.green = "#A6E3A1"
      colors.blue = "#87B0F9"
      colors.purple = "#bd93f9"
      colors.yellow = "#F9E2AF"
      colors.black = "none"
      colors.NormalBg = "none"
      colors.ActiveBg = "none"
      colors.InactiveBg = "none"
      return colors
    end,
  }
end

return M
