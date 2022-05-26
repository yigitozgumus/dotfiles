" Description: Plugins
"
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'godoctor/godoctor.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'udalov/kotlin-vim'
Plug 'sheerun/vim-polygot'

call plug#end()
