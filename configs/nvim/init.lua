-- Personal vim configuration

require("core.base")
require("core.keymaps")
require("core.colors")
require("core.autocmds")

-- Plugin setup
require("plugins").setup()

-- Impatient plugin to speed up the opening
require("impatient")

-- Plugins
require("config.git")
require("config.gitsigns")
require("config.fugitive")
require("config.nvim-tree")
require("config.undotree")
require("config.telescope")
require("config.zen-mode")
require("config.markdown-preview")
require("config.harpoon")
require("config.go")
require("config.nvim-cmp")
require("config.lspkind")
require("config.comment")

-- LSP Related Plugins
require("config.lsp.mason")
require("config.lsp.lspsaga")
require("config.lsp.lspconfig")
require("config.lsp.null-ls")
require("config.rust-tools")

-- Themes
require("config.neosolarized")
require("config.nightfox")
require("config.gruvbox")
require("config.catppuccin")
require("config.tokyonight")

-- Colorscheme
require("core.colorscheme")
