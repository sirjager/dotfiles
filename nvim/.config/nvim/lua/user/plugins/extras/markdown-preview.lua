local ok, mdpreview = pcall(require, "markdown-preview")
if not ok then
  return
end

mdpreview.setup {}
