-- Personal vim configuration

require("plugins-setup")

require("core.base")
require("core.keymaps")
require("core.colors")
require("core.autocmds")
require("core.colorscheme")

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
require("plugins.rust-tools")
require("plugins.comment")

-- LSP Related Plugins
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")

-- Themes
require("plugins.neosolarized")
require("plugins.nightfox")
require("plugins.gruvbox")
require("plugins.catppuccin")
require("plugins.tokyonight")
