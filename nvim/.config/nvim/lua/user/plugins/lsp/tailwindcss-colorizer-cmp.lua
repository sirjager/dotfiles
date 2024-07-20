local oktcc, pkg = pcall(require, "tailwindcss-colorizer-cmp")
if oktcc then
  pkg.setup {
    color_square_width = 2,
  }
end

local okcmp, cmp = pcall(require, "cmp")
if okcmp then
  cmp.config.formatting = {
    format = require("tailwindcss-colorizer-cmp").formatter,
  }
end
