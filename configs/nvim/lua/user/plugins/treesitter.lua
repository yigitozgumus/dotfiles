local parser_config = require('nvim-treesitter.parsers').get_parser_configs();

require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  indent = {
    enable = { 'html', 'kotlin', 'javascript', 'typescript', 'go' },
  },
  highlight = {
    enable = true,
    disable = { 'NvimTree' },
    additional_vim_regex_highlighting = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['ia'] = '@parameter.inner',
        -- ['aa'] = {
        --   php = "" '@parameter.outer',

        --   python = "(function_definition) @function",
        --   cpp = "(function_definition) @function",
        --   c = "(function_definition) @function",
        --   java = "(method_declaration) @function",
        -- },
      },
    },
  },
  context_commentstring = {
    enable = true,
  },
}

