local ok_lab, lab = pcall(require, "lab")
if ok_lab then
  lab.setup {
    code_runner = {
      enabled = true,
    },
    quick_data = {
      enabled = true,
    }
  }
end
