vim.opt.termguicolors = true
 vim.cmd([[
   highlight IndentBlanklineJess guifg=#2F313C gui=nocombine
 ]])

 require('indent_blankline').setup {
   filetype_exclude = {
     'help',
     'terminal',
     'dashboard',
     'packer',
     'lspinfo',
     'TelescopePrompt',
     'TelescopeResults',
   },
   buftype_exclude = { 'terminal', 'NvimTree' },
   show_trailing_blankline_indent = false,
   show_first_indent_level = true,
   -- show_current_context = true,
   -- show_current_context_start = true,
   char_highlight_list = {
     'IndentBlanklineJess'
   }
 }

-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
--
-- require("indent_blankline").setup {
--     char = "",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
-- }
