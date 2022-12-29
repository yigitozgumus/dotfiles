local M = {}

function M.setup()
	-- Indicate first time installation
	local is_boostrap = false

	-- packer.nvim configuration
	local conf = {
		max_jobs = 10,
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}

	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			fn.system({
				"git",
				"clone",
				"--depth",
				"1",
				"https://github.com/wbthomason/packer.nvim",
				install_path,
			})
			is_boostrap = true
			vim.cmd([[packadd packer.nvim]])
		end

		-- Run PackerCompile if there are changes in this file
		-- vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
		local packer_grp = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			pattern = vim.fn.expand("$MYVIMRC"),
			command = "source <afile> | PackerCompile",
			group = packer_grp,
		})
	end

	-- Plugins
	local function plugins(use)
		-- Let packer manage itself
		use({ "wbthomason/packer.nvim" })

		-- Make neovim faster
		use({ "lewis6991/impatient.nvim", disable = false })

        use({ "nvim-lua/plenary.nvim", module = "plenary" }) -- lua functions that many plugins use
        -- -- Notification
        use({
            "rcarriga/nvim-notify",
            event = "BufReadPre",
            config = function()
                require("config.notify").setup()
            end,
            disable = false,
        })
        use({
            "vigoux/notifier.nvim",
            config = function()
                require("notifier").setup({})
            end,
            disable = true,
        })
        --
        -- Colorscheme
        use({
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("config.catppuccin").setup()
            end,
            disable = false,
        })
        --
        use({
            "folke/tokyonight.nvim",
            disable = false,
        })
        --
        use({ "projekt0n/github-nvim-theme", disable = false })
        --
        use({
            "sainnhe/gruvbox-material",
            disable = false,
        })
        -- Code documentation
        use({
            "danymat/neogen",
            config = function()
                require("config.neogen").setup()
            end,
            cmd = { "Neogen" },
            module = "neogen",
            disable = false,
        })
        use {
            'VonHeikemen/fine-cmdline.nvim',
            requires = {
                {'MunifTanjim/nui.nvim'}
            },
            config = function() require("config.cmdline").setup() end,
        }

		use({
			"anuvyklack/hydra.nvim",
			config = function()
				require("config.hydra").setup()
			end,
			requires = "anuvyklack/keymap-layer.nvim",
			module = { "hydra" },
			event = { "BufReadPre" },
			disable = true,
		})
		--
        -- tmux & split window navigation
		use({ "christoomey/vim-tmux-navigator", disable = true }) 
		--
		use("szw/vim-maximizer") -- maximizes and restores current window
		--
		-- Better surround
		use({ "tpope/vim-surround", event = "BufReadPre" })
		use({
			"Matt-A-Bennett/vim-surround-funk",
			event = "BufReadPre",
			config = function()
				require("config.surroundfunk").setup()
			end,
			disable = false,
		})
        --
		-- Motions
		use({ "andymass/vim-matchup", event = "CursorMoved" })
		use({ "wellle/targets.vim", event = "CursorMoved", disable = false })
		use({
			"unblevable/quick-scope",
			keys = { "F", "f", "T", "t" },
			-- config = function()
			--   vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
			-- end,
			disable = false,
		})
		-- IDE
		use({
			"max397574/better-escape.nvim",
			event = { "InsertEnter" },
			config = function()
				require("better_escape").setup({
					mapping = { "jk" },
					timeout = vim.o.timeoutlen,
					keys = "<ESC>",
				})
			end,
		})

		use({
			"karb94/neoscroll.nvim",
			event = "BufReadPre",
			config = function()
				require("config.neoscroll").setup()
			end,
			disable = true,
		})

		use({
			"anuvyklack/windows.nvim",
			requires = { "anuvyklack/middleclass", "anuvyklack/animation.nvim" },
			cmd = { "WindowsToggleAutowidth", "WindowsMaximize" },
			config = function()
				vim.o.winwidth = 10
				vim.o.winminwidth = 10
				vim.o.equalalways = false
				require("windows").setup()
			end,
			disable = false,
		})
		--
		use({
			"beauwilliams/focus.nvim",
			cmd = { "FocusToggle", "FocusMaxOrEqual" },
			module = "focus",
			config = function()
				require("focus").setup({ hybridnumber = true })
			end,
			disable = false,
		})
		-- -- Better Comment
		 use({
		 	"numToStr/Comment.nvim",
		 	opt = true,
		 	keys = { "gc", "gcc", "gbc" },
		 	config = function()
		 		require("Comment").setup({})
		 	end,
		 	disable = false,
		 })

		use({
			"echasnovski/mini.nvim",
			event = { "BufReadPre" },
			config = function()
				require("config.mini").setup()
			end,
			disable = false,
		})

        -- Statusline
        use({
            "nvim-lualine/lualine.nvim",
            event = "BufReadPre",
            config = function()
                require("config.lualine").setup()
            end,
            disable = false,
        })
        -- Jumps
        use({
            "phaazon/hop.nvim",
            cmd = "HopWord",
            module = "hop",
            keys = { "f", "F", "t", "T" },
            config = function()
                require("config.hop").setup()
            end,
            disable = true,
        })
        use({
            "folke/noice.nvim",
            config = function()
                require("config.noice").setup()
            end,
            requires = {
                "MunifTanjim/nui.nvim",
                "rcarriga/nvim-notify",
            },
            disable = true,
        })
        use({
            "ggandor/leap.nvim",
            keys = { "s", "S" },
            config = function()
                local leap = require("leap")
                leap.add_default_mappings()
            end,
            disable = true,
        })
        -- vscode-like pictograms
        use("onsails/lspkind-nvim")
        --
        --  Nvim dashboard
        use({
            "goolord/alpha-nvim",
            config = function()
                require("config.alpha").setup()
            end,
            disable = false,
        })
        --
        -- Telescope
        use({
            "nvim-telescope/telescope.nvim",
            event = { "VimEnter" },
            config = function()
                require("config.telescope").setup()
            end,
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
                { "nvim-telescope/telescope-project.nvim" },
                { "cljoly/telescope-repo.nvim" },
                { "nvim-telescope/telescope-file-browser.nvim" },
                {
                    "ahmedkhalf/project.nvim",
                    config = function()
                        require("config.project").setup()
                    end,
                },
                { "nvim-telescope/telescope-dap.nvim" },
                {
                    "AckslD/nvim-neoclip.lua",
                    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
                },
                { "nvim-telescope/telescope-smart-history.nvim" },
                { "dhruvmanila/telescope-bookmarks.nvim" },
                { "nvim-telescope/telescope-github.nvim" },
                "nvim-telescope/telescope-symbols.nvim",
            },
        })
        --
        -- trouble.nvim
        use({
            "folke/trouble.nvim",
            cmd = { "TroubleToggle", "Trouble" },
            module = { "trouble.providers.telescope" },
            config = function()
                require("trouble").setup({ use_diagnostic_signs = true })
            end,
            disable = false,
        })

        -- Rust
        use({
        	"simrat39/rust-tools.nvim",
        	requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
        	opt = true,
        	module = "rust-tools",
        	ft = { "rust" },
        })
        use({
        	"saecki/crates.nvim",
        	event = { "BufRead Cargo.toml" },
        	requires = { { "nvim-lua/plenary.nvim" } },
        	config = function()
        		require("crates").setup({
        			null_ls = { enabled = true, name = "crates.nvim" },
        		})
        	end,
        	disable = false,
        })

        -- Go
        use({
            "ray-x/go.nvim",
            ft = { "go" },
            config = function()
            require("go").setup()
            end,
            disable = false,
        })
        -- Better icons
        use({
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup({ default = true })
            end,
            disable = false,
        })

		use({ "segeljakt/vim-silicon", cmd = { "Silicon" } })

		use({
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup({
					backends = { "treesitter", "lsp" },
					on_attach = function(bufnr)
						vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
						vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
					end,
				})
			end,
			module = { "aerial", "telescope._extensions.aerial" },
			cmd = { "AerialToggle" },
			disable = false,
		})

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				{ "hrsh7th/cmp-nvim-lsp", module = { "cmp_nvim_lsp" } },
				"hrsh7th/cmp-nvim-lsp-signature-help",
				"lukas-reineke/cmp-rg",
				"davidsierradz/cmp-conventionalcommits",
				{ "onsails/lspkind-nvim", module = { "lspkind" } },
				{
					"L3MON4D3/LuaSnip",
					module = { "luasnip" },
				},
				"rafamadriz/friendly-snippets",
				"honza/vim-snippets",
				{ "tzachar/cmp-tabnine", run = "./install.sh", disable = true },
			},
			disable = false,
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				-- { "lvimuser/lsp-inlayhints.nvim", branch = "readme" },
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
				{ "jayp0521/mason-null-ls.nvim" },
				"folke/neodev.nvim",
				"RRethy/vim-illuminate",
				"jose-elias-alvarez/null-ls.nvim",
				{
					"j-hui/fidget.nvim",
					config = function()
						require("fidget").setup({})
					end,
				},
				{ "b0o/schemastore.nvim", module = { "schemastore" } },
				{ "jose-elias-alvarez/typescript.nvim", module = { "typescript" } },
				{
					"SmiteshP/nvim-navic",
					-- "alpha2phi/nvim-navic",
					config = function()
						require("nvim-navic").setup({})
					end,
					module = { "nvim-navic" },
				},
				{
					"simrat39/inlay-hints.nvim",
					config = function()
						require("inlay-hints").setup()
					end,
				},
				{
					"zbirenbaum/neodim",
					event = "LspAttach",
					config = function()
						require("config.neodim").setup()
					end,
					disable = false,
				},
				{
					"theHamsta/nvim-semantic-tokens",
					config = function()
						require("config.semantictokens").setup()
					end,
					disable = false,
				},
				{ "David-Kunz/markid", disable = true },
				{
					"simrat39/symbols-outline.nvim",
					cmd = { "SymbolsOutline" },
					config = function()
						require("symbols-outline").setup()
					end,
					disable = false,
				},
				-- {
				--   "weilbith/nvim-code-action-menu",
				--   cmd = "CodeActionMenu",
				-- },
				-- {
				--   "rmagatti/goto-preview",
				--   config = function()
				--     require("goto-preview").setup {}
				--   end,
				-- },
				-- {
				--   "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				--   config = function()
				--     require("lsp_lines").setup()
				--   end,
				-- },
			},
            disable = true
		})

		-- vimspector
		use({
			"puremourning/vimspector",
			cmd = { "VimspectorInstall", "VimspectorUpdate" },
			fn = {
				"vimspector#Launch()",
				"vimspector#ToggleBreakpoint",
				"vimspector#Continue",
			},
			config = function()
				require("config.vimspector").setup()
			end,
			disable = false,
		})

		-- -- Test
		-- use({
		-- 	"nvim-neotest/neotest",
		-- 	requires = {
		-- 		{
		-- 			"vim-test/vim-test",
		-- 			event = { "BufReadPre" },
		-- 			config = function()
		-- 				require("config.test").setup()
		-- 			end,
		-- 		},
		-- 		"nvim-lua/plenary.nvim",
		-- 		"nvim-treesitter/nvim-treesitter",
		-- 		{ "nvim-neotest/neotest-vim-test", module = { "neotest-vim-test" } },
		-- 		{ "nvim-neotest/neotest-python", module = { "neotest-python" } },
		-- 		{ "nvim-neotest/neotest-plenary", module = { "neotest-plenary" } },
		-- 		{ "nvim-neotest/neotest-go", module = { "neotest-go" } },
		-- 		{ "haydenmeade/neotest-jest", module = { "neotest-jest" } },
		-- 		{ "rouge8/neotest-rust", module = { "neotest-rust" } },
		-- 	},
		-- 	module = { "neotest", "neotest.async" },
		-- 	config = function()
		-- 		require("config.neotest").setup()
		-- 	end,
		-- 	disable = false,
		-- })
		-- use({ "diepm/vim-rest-console", ft = { "rest" }, disable = false })
		-- use({
		-- 	"NTBBloodbath/rest.nvim",
		-- 	config = function()
		-- 		require("rest-nvim").setup({})
		-- 		vim.keymap.set("n", "<C-j>", "<Plug>RestNvim", { noremap = true, silent = true })
		-- 	end,
		-- 	disable = true,
		-- })
		--
		-- -- Legendary
		-- use({
		-- 	"mrjones2014/legendary.nvim",
		-- 	opt = true,
		-- 	keys = { [[<C-p>]] },
		-- 	module = { "legendary" },
		-- 	cmd = { "Legendary" },
		-- 	config = function()
		-- 		require("config.legendary").setup()
		-- 	end,
		-- 	disable = true,
		-- })
		--
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("config.toggleterm").setup()
			end,
			disable = false,
		})

		-- lspsaga.nvim
		use({
			"glepnir/lspsaga.nvim",
			cmd = { "Lspsaga" },
			config = function()
				require("config.lspsaga").setup()
			end,
			disable = false,
		})

		-- renamer.nvim
		use({
			"filipdutescu/renamer.nvim",
			modulm = { "renamer" },
			config = function()
				require("renamer").setup({})
			end,
			disable = false,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter").setup()
			end,
			requires = {
				{
					"nvim-treesitter/nvim-treesitter-textobjects",
					event = "BufReadPre",
				},
				{ "RRethy/nvim-treesitter-textsubjects", event = "BufReadPre" },
				{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle" } },
				{
					"nvim-treesitter/nvim-treesitter-context",
					event = "BufReadPre",
					disable = false,
				},
				{
					"m-demare/hlargs.nvim",
					config = function()
						require("config.hlargs").setup()
					end,
					disable = false,
				},
			},
		})

		use({
			"ibhagwan/fzf-lua",
			-- optional for icon support
			requires = { "nvim-tree/nvim-web-devicons" },
			disable = false,
		})

		-- nvim-tree
		use({
			"nvim-tree/nvim-tree.lua",
			opt = true,
			cmd = { "NvimTreeToggle", "NvimTreeClose" },
			config = function()
				require("config.nvimtree").setup()
			end,
		})

		-- Buffer line
		use({
			"akinsho/nvim-bufferline.lua",
			event = "BufReadPre",
			config = function()
				require("config.bufferline").setup()
			end,
		})

		-- WhichKey
		use({
			"folke/which-key.nvim",
			config = function()
				require("config.whichkey").setup()
			end,
		})

		-- IndentLine
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("config.indentblankline").setup()
			end,
		})

		-- use({
		-- 	"ggandor/lightspeed.nvim",
		-- 	keys = { "s", "S", "f", "F", "t", "T" },
		-- 	config = function()
		-- 		require("lightspeed").setup({})
		-- 	end,
		-- })
		-- -- Doc
		-- use({ "nanotee/luv-vimdocs", event = "BufReadPre" })
		-- use({ "milisims/nvim-luaref", event = "BufReadPre" })


		-- User interface
		use({
			"stevearc/dressing.nvim",
			event = "BufReadPre",
			config = function()
				require("dressing").setup({
					input = { relative = "editor" },
					select = { backend = { "telescope", "fzf", "builtin" } },
				})
			end,
			disable = false,
		})
		use({ "ray-x/guihua.lua", run = "cd lua/fzy && make", disable = true })
		use({
			"doums/suit.nvim",
			config = function()
				require("suit").setup({})
			end,
			disable = false,
		})

		-- Auto pairs
		use({
			"windwp/nvim-autopairs",
			opt = true,
			event = "InsertEnter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		})
		-- git integration
		use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
		--
		-- use("folke/zen-mode.nvim")

		-- Markdown
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
			ft = "markdown",
			cmd = { "MarkdownPreview" },
			disable = false,
		})

		-- Harpoon
		use({
			"ThePrimeagen/harpoon",
			module = {
				"harpoon",
				"harpoon.cmd-ui",
				"harpoon.mark",
				"harpoon.ui",
				"harpoon.term",
				"telescope._extensions.harpoon",
			},
			config = function()
				require("config.harpoon").setup()
			end,
			disable = false,
		})

		-- Debugging
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			module = { "dap" },
			requires = {
				{
					"theHamsta/nvim-dap-virtual-text",
					module = { "nvim-dap-virtual-text" },
				},
				{ "rcarriga/nvim-dap-ui", module = { "dapui" } },
				{ "mfussenegger/nvim-dap-python", module = { "dap-python" } },
				"nvim-telescope/telescope-dap.nvim",
				{ "leoluz/nvim-dap-go", module = "dap-go" },
				-- { "jbyuki/one-small-step-for-vimkind", module = "osv" },
				-- { "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
			},
			config = function()
				require("config.dap").setup()
			end,
			disable = false,
		})

		use({"junegunn/goyo.vim"})
		use({"mbbill/undotree"})
		use({"tpope/vim-fugitive"})
		--
		-- use({
		-- 	"epwalsh/obsidian.nvim",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("obsidian").setup({
		-- 			dir = "~/personal/notes/Notes-Collection/",
		-- 			completion = {
		-- 				nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
		-- 			},
		-- 		})
		-- 	end,
		-- })
		use("martinsione/darkplus.nvim")

		if is_boostrap then
			print("Neovim restart is required after installation!")
			require("packer").sync()
		end
	end
	-- Init and start packer
	packer_init()
	local packer = require("packer")

	-- Performance
	pcall(require, "impatient")
	-- pcall(require, "packer_compiled")

	packer.init(conf)
	packer.startup(plugins)
end

return M
