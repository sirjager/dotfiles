local name = "nvim-autopairs"
local ok, pkg = pcall(require, name)
if not ok then
  return vim.notify(name .. " not installed", vim.log.levels.ERROR)
end


pkg.setup {
  check_ts = true,
  map_char = {
    all = "(",
    tex = "{",
  },
  enable_check_bracket_line = false,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true,
  disable_in_macro = false,
  enable_afterquote = true,
  map_bs = true,
  map_c_w = false,
  fast_wrap = {
    map = "<A-r>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}


name = "cmp"
local ok2, cmp = pcall(require, name)
if not ok2 then
  return vim.notify(name .. " not installed", vim.log.levels.ERROR)
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
