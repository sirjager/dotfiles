local M = {}

local bg = "#161622"
local fg = "#B4BEFE"

local border = "#B4BEFE"
local none = "None"

local accent = "#EF9F76" -- matches with tmux border

local dimtext = "#414559"
local cursorline_bg = "#292c3c"
local cursorline_fg = "#B4BEFE"

M.Normal = { bg = none }
M.HoverNormal = { fg = fg, bg = none }
M.HoverBorder = { fg = fg, bg = none }

M.Pmenu = { fg = fg, bg = none }
M.PmenuSel = { fg = bg, bg = accent }
M.PmenuSbar = { fg = none, bg = none }
M.PmenuThumb = { fg = none, bg = accent }

M.NormalFloat = { bg = none }
M.FloatBorder = { fg = fg, bg = none }

M.FloatTitle = { fg = fg, bg = bg }
M.FloatFooter = { fg = fg, bg = bg }
M.FloatShadow = { bg = none }

M.MiniFilesNormal = M.NormalFloat
M.MiniFilesBorder = { fg = dimtext, bg = none }
M.MiniFilesFile = { fg = dimtext }
M.MiniFilesDirectory = { fg = dimtext }
M.MiniFilesCursorLine = { fg = cursorline_fg, bg = cursorline_bg }

return M
