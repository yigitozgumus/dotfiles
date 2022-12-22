local pluginActive = true
if (not pluginActive) then return end

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.22+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "kotlin",
    "python",
    "rust",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})
