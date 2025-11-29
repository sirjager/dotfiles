return {
  root_dir = function(...)
    return require("lspconfig/util").root_pattern("package.json", "tsconfig.json")(...)
  end,
}
