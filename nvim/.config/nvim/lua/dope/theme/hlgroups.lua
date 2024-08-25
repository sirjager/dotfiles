local M = {}

local bg = "#161622"
local border = "#B4BEFE"
local none = "None"

M.Normal = { bg = bg }

M.HoverNormal = { fg = border, bg = bg }
M.HoverBorder = { fg = border, bg = bg }

M.NormalFloat = { bg = bg }
M.FloatBorder = { fg = border, bg = bg }
M.FloatTitle = { fg = border, bg = bg }
M.FloatFooter = { fg = border, bg = bg }
M.FloatShadow = { bg = none }

return M
