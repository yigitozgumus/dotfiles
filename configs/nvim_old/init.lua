-- Personal vim configuration

require("config")
require("utils")

-- Leader setting
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Plugin setup
require("plugins").setup()

vim.cmd("colorscheme catppuccin")
