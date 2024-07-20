local ok, autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  return
end

autotag.setup {
  ft = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "html",
  },
}
