"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Distraction free writing
Plug 'junegunn/goyo.vim'
" Python mode
Plug 'python-mode/python-mode', { 'branch': 'develop' }
" Alignment of the assignment statements
Plug 'junegunn/vim-easy-align'
" Bottom status bar plugin 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Tex Live Preview 
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Nerd Tree plugin for file traversing inside vim
Plug 'scrooloose/nerdtree'
" Colorschemes to not get bored
Plug 'flazz/vim-colorschemes'
" Emmet Plugin for the web development stuff
Plug 'mattn/emmet-vim'
" Tex Plugin for vim
Plug 'lervag/vimtex'
" Better syntax highlighting for python 
Plug 'davidhalter/jedi-vim'
Plug 'sheerun/vim-polyglot'
Plug 'luochen1990/rainbow'
Plug 'godlygeek/tabular'
Plug 'vim-python/python-syntax'
Plug 'drewtempelmeyer/palenight.vim'"
Plug 'rust-lang/rust.vim'
Plug 'dracula/vim'
Plug 'ternjs/tern_for_vim',{'do': 'npm install'}
Plug 'ntk148v/vim-horizon'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Settings File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:so /Users/${USER}/.vimrc.core

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable full color support for iTerm
set term=xterm-256color
"colorscheme palenight
colorscheme gruvbox
" Ruby setup installation
let $RUBYHOME=$HOME."/.rbenv/versions/2.6.1"
set rubydll=$HOME/.rbenv/versions/2.6.1/lib/libruby.2.6.1.dylib"
set omnifunc=syntaxcomplete#Complete
let g:python3_host_prog = '/usr/local/opt/python/libexec/bin/python'
