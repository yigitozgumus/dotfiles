local packer = require 'lib.packer-init'

packer.startup(function(use)
    use {'wbthomason/packer.nvim'} -- Let packer manage itself

    use {'airblade/vim-rooter'}
    use {'christoomey/vim-tmux-navigator'}
    use {'farmergreg/vim-lastplace'}
    use {'tpope/vim-commentary'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-surround'}
    use {'tpope/vim-eunuch'} -- Adds :Rename, :SudoWrite
    use {'tpope/vim-unimpaired'} -- Adds [b and other handy mappings
    use {'tpope/vim-sleuth'} -- Indent autodetection with editorconfig support
    use {'navarasu/onedark.nvim'}
    use {'Mofiqul/vscode.nvim'}

    use {
        'sickill/vim-pasta',
        config = function() require('user.plugins.pasta') end
    }

    use {
        'jessarcher/vim-sayonara',
        config = function() require('user.plugins.sayonara') end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('user.plugins.indent-blankline') end
    }

    use {
        'AndrewRadev/splitjoin.vim',
        config = function() require('user.plugins.splitjoin') end
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('user.plugins.bufferline') end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('user.plugins.lualine') end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('user.plugins.nvim-tree') end
    }

    use {
        'karb94/neoscroll.nvim',
        config = function() require('user.plugins.neoscroll') end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup {sign_priority = 20}
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'}, {'kyazdani42/nvim-web-devicons'},
            {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
            {'nvim-telescope/telescope-live-grep-raw.nvim'}
        },
        config = function() require('user.plugins.telescope') end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        config = function()
            require('user.plugins.treesitter')
            require('spellsitter').setup()
        end
    }

    use {'tpope/vim-fugitive', requires = 'tpope/vim-rhubarb', cmd = 'G'}

    use {
        "williamboman/nvim-lsp-installer",
        {
            'neovim/nvim-lspconfig',
            requires = {
                'b0o/schemastore.nvim',
                'folke/lsp-colors.nvim',
                'weilbith/nvim-code-action-menu'
            },
            config = function()
                require('user.plugins.lspinstaller')
                require('user.plugins.lspconfig')
            end
        }
    }
    use { "jose-elias-alvarez/null-ls.nvim" ,
    config = function() require('user.plugins.null-ls') end
    }
    use "jose-elias-alvarez/nvim-lsp-ts-utils"
    use {'folke/tokyonight.nvim'}
    use {
        'EdenEast/nightfox.nvim',
        config = function() require('user.plugins.nightfox') end
    }

    use {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup {} end
    }

    use {
        'L3MON4D3/LuaSnip',
        config = function() require('user.plugins.luasnip') end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip', 'L3MON4D3/LuaSnip',
            'jessarcher/cmp-path', 'hrsh7th/cmp-nvim-lua',
            'onsails/lspkind-nvim', 'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = function() require('user.plugins.cmp') end
    }
    use { "leafgarland/typescript-vim" }
    use { "maxmellon/vim-jsx-pretty" }
    use { "HerringtonDarkholme/yats.vim" }
    use { 'junegunn/fzf.vim' }
    use { 'junegunn/fzf' }
    use { "voldikss/vim-floaterm" }
    use {
        "cormacrelf/dark-notify" ,
    config = function() require('user.plugins.dark-notify') end
    }
    use {  'junegunn/goyo.vim' }

end)
