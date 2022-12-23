-- Personal vim configuration

-- Plugin setup
require("plugins-setup")

-- Impatient plugin to speed up the opening
require("impatient")

require("core.base")
require("core.keymaps")
require("core.colors")
require("core.autocmds")

-- Plugins
require("plugins.autopairs")
require("plugins.bufferline")
require("plugins.git")
require("plugins.gitsigns")
require("plugins.fugitive")
require("plugins.lualine")
require("plugins.nvim-tree")
require("plugins.undotree")
require("plugins.telescope")
require("plugins.zen-mode")
require("plugins.treesitter")
require("plugins.markdown-preview")
require("plugins.harpoon")
require("plugins.go")
require("plugins.nvim-cmp")
require("plugins.lspkind")
require("plugins.comment")

-- LSP Related Plugins
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.rust-tools")

-- Themes
require("plugins.neosolarized")
require("plugins.nightfox")
require("plugins.gruvbox")
require("plugins.catppuccin")
require("plugins.tokyonight")

-- Colorscheme
require("core.colorscheme")
