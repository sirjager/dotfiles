return {
  settings = {
    json = {
      validate = { enable = true },
      schemas = require("schemastore").json.schemas {
        extra = {
          {
            description = "Biome, Fast formatter and linter writter in rust",
            fileMatch = "biome.json",
            name = "biome.json",
            url = "https://biomejs.dev/schemas/1.8.3/schema.json",
          },
        },
      },
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}
