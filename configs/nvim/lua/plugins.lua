local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use { 'wbthomason/packer.nvim' } -- Let packer manage itself

    use 'nvim-lualine/lualine.nvim' -- Statusline

    use 'onsails/lspkind-nvim' -- vscode-like pictograms

    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'kyazdani42/nvim-web-devicons' -- File icons
    -- Fuzzy Finder (files, lsp, etc)
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'folke/zen-mode.nvim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'akinsho/nvim-bufferline.lua'

    use 'lewis6991/gitsigns.nvim'
    use 'ray-x/go.nvim'
    use('theprimeagen/harpoon')
    use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'junegunn/goyo.vim'
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    -- Additional features over rust analyzer
    use("simrat39/rust-tools.nvim")
    -- LSP format
    use "lukas-reineke/lsp-format.nvim"

    -- Language Server Protocol
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use('MunifTanjim/prettier.nvim')
    use 'Mofiqul/vscode.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    if packer_bootstrap then
        require('packer').sync()
    end
end)
