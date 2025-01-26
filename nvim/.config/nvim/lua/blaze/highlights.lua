-- create or update highlight groups
-- check all highlight groups using :hi

local M = {}

local none = "None" -- to nil / transparent
local fg = "#B4BEFE" -- for text
local bg = "#161622" -- for bg

local primary = "#f5a97f" -- controls the majoriry of ui color
local accent = "#FFDAB3" -- similar to primary with lit tweak

local border = primary

local dimtext = "#B4BEFE"
local cursorline_bg = "#292c3c"
local cursorline_fg = primary

M.Normal = { bg = none }
M.HoverNormal = { fg = fg, bg = none }
M.HoverBorder = { fg = border, bg = none }

M.LineNr = { fg = "#525280", bg = none } -- line numbers

M.Visual = { fg = bg, bg = primary } -- visual mode selection bg

M.Pmenu = { fg = fg, bg = none }
M.PmenuSel = { fg = bg, bg = primary }
M.PmenuSbar = { fg = none, bg = none }
M.PmenuThumb = { fg = none, bg = primary }

M.NormalFloat = { bg = none }
M.FloatBorder = { fg = border, bg = none }

M.FloatTitle = { fg = fg, bg = bg }
M.FloatFooter = { fg = fg, bg = bg }
M.FloatShadow = { bg = bg }

-- mini.files
M.MiniFilesNormal = M.NormalFloat
M.MiniFilesBorder = { fg = border, bg = none }
M.MiniFilesFile = { fg = dimtext }
M.MiniFilesDirectory = { fg = dimtext }
M.MiniFilesCursorLine = { fg = cursorline_fg, bg = cursorline_bg }

-- which key
M.WhichKeyBorder = { fg = border, bg = none }
M.WhichKeyTitle = { fg = fg, bg = none }

-- telescope
M.TelescopeBorder = { fg = border, bg = none }
M.TelescopePromptBorder = M.TelescopeBorder
M.TelescopeResultsBorder = M.TelescopeBorder
M.TelescopePreviewBorder = M.TelescopeBorder

-- noice
M.NoiceCmdlinePopupBorder = { fg = border, bg = none }
M.NoiceCmdlinePopupBorderHelp = M.NoiceCmdlinePopupBorder
M.NoiceCmdlinePopupBorderSearch = M.NoiceCmdlinePopupBorder
M.NoiceCmdlinePopupBorderInput = M.NoiceCmdlinePopupBorder
M.NoiceCmdlinePopupBorderLua = M.NoiceCmdlinePopupBorder

-- dashboard https://github.com/nvimdev/dashboard-nvim?tab=readme-ov-file#highlight
M.DashboardHeader = { fg = primary, bg = none }
M.DashboardShortCut = { fg = accent, bg = none }
M.DashboardFooter = { fg = accent, bg = none }

return M
