-- Personal Neovim Configuration

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("config.plugins", {
	defaults = { lazy = true },
	install = { colorscheme = { "catppuccin", "gruvbox-material" } },
	checker = { enabled = true, notify = false },
	diff = {
		cmd = "terminal_git",
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
				"nvim-treesitter-textobjects",
			},
		},
	},
	debug = false,
})

vim.keymap.set("n", "<leader>l", "<cmd>:Lazy<cr>")

require("config.base")

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("config.util").version()
		require("config.keymaps")
		require("config.autocommands")
	end,
})
