-- Personal vim configuration

require("core.base")
require("core.keymaps")
require("core.colors")
require("core.autocmds")
require("config")
require("utils")

-- Plugin setup
require("plugins").setup()

vim.cmd("colorscheme catppuccin")
