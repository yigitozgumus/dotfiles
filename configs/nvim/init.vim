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

runtime ./plug.vim
runtime ./macos.vim
runtime ./maps.vim

"}}}

" Colorscheme "{{{
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


"}}}


" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
