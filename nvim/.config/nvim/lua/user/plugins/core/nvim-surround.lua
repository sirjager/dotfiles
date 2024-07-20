local ok, pkg = pcall(require, "nvim-surround")
if not ok then
  return
end

pkg.setup()

-- https://github.com/kylechui/nvim-surround/blob/main/doc/nvim-surround.txt
