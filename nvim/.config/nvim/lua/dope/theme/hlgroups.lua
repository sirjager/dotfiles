local M = {}

local bg = "#161622"
local border = "#B4BEFE"
local none = "None"

M.Normal = { bg = none }
M.HoverNormal = { fg = border, bg = none }
M.HoverBorder = { fg = border, bg = none }

M.NormalFloat = { bg = none }
M.FloatBorder = { fg = border, bg = none }

M.FloatTitle = { fg = border, bg = bg }
M.FloatFooter = { fg = border, bg = bg }
M.FloatShadow = { bg = none }

return M
