local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	-- Let packer manage itself
	use({ "wbthomason/packer.nvim" })

	-- Make neovim faster
	use("lewis6991/impatient.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
	})

	-- vscode-like pictograms
	use("onsails/lspkind-nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	--  Nvim dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("config.alpha").setup()
		end,
	})

	-- vs-code like icons
	use("nvim-tree/nvim-web-devicons")

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable("make") == 1 })
	use("nvim-telescope/telescope-file-browser.nvim")

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("config.toggleterm").setup()
		end,
	})

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("config.treesitter").setup()
		end,
	})

	use({ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	})

	-- WhichKey
	use({
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("config.whichkey").setup()
		end,
	})

	use({
		"ggandor/lightspeed.nvim",
		keys = { "s", "S", "f", "F", "t", "T" },
		config = function()
			require("lightspeed").setup({})
		end,
	})

	-- auto closing
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs").setup()
		end,
	})
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("folke/zen-mode.nvim")

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("config.bufferline").setup()
		end,
	})

	use("ray-x/go.nvim")
	use("theprimeagen/harpoon")

	use("ray-x/guihua.lua") -- recommanded if need floating window support

	use({ "catppuccin/nvim", as = "catppuccin" })
	use("junegunn/goyo.vim")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	-- Additional features over rust analyzer
	use("simrat39/rust-tools.nvim")

	-- Colorschemes
	use({ "ellisonleao/gruvbox.nvim" })
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use("EdenEast/nightfox.nvim") -- Packer
	use("martinsione/darkplus.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
