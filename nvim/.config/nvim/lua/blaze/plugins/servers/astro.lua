return {
  init_options = {
    typescript = {
      tsdk = "node_modules/typescript/lib",
    },
  },
  root_dir = function(...)
    return require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "astro.config.mjs")(...)
  end,
}
