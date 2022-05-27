" NVIM Config
"
" Fundamentals "{{{

filetype off
filetype plugin indent on
set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

"}}}

" Import "{{{

" Plugins
runtime ./plug.vim
lua require('packer_init')
lua require('plugins/nvim-tree')
lua require('plugins/indent-blankline')
lua require('plugins/nvim-cmp')
lua require('plugins/nvim-lspconfig')
lua require('plugins/nvim-treesitter')
lua require('plugins/alpha-nvim')

runtime ./macos.vim
runtime ./maps.vim

lua require('core/options')
lua require('core/autocmds')
lua require('core/keymaps')
"}}}

" Colorscheme "{{{

lua require('core/colors')

set termguicolors
syntax on
let g:onedark_config = {
  \ 'style': 'warmer',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
\ }
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme onedark

" }}}

" Statusline "{{{

lua require('core/statusline')

"}}}


" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
