-- Personal vim configuration

require 'user.options'
require 'user.plugins'
require 'user.keymaps'
require 'user.misc'
require 'user.colors'
require 'user.autocmds'

-- Colorscheme
-- Lua:
-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme
-- jjvim.o.background = "light"
-- Enable transparent background
vim.g.vscode_transparent = 1

-- vim.g.tokyonight_transparent = 1

-- Enable italic comment
vim.g.vscode_italic_comment = 1
-- Disable nvim-tree background color
vim.g.vscode_disable_nvimtree_bg = true
-- Potential colorschemes: vscode onedark tokyonight
vim.cmd([[colorscheme duskfox]])

-- vim: nospell
