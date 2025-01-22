return {
  yaml = {
    schemastore = {
      enable = false,
      url = "",
    },
    validate = { enable = false },
    schemas = require("schemastore").yaml.schemas({
      extra = {
        {
          description = 'Taskfile schema',
          fileMatch = 'Taskfile.yaml',
          name = 'Taskfile.yaml',
          url = 'https://taskfile.dev/schema.json',
        },
      }
    }),
  },

}
