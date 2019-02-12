"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is my personal vim configuration
" 
"  Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen installation
execute pathogen#infect()

" Set compatibility to Vim only.
set nocompatible

" Enable filetype plugins
filetype plugin on
filetype indent on

"Key mapping of the leader
let mapleader = ","

" Fast saving"
nmap <leader>w :w!<cr>

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Show line numbers
set number

" Fast reloading for configuration change 
map <leader>rr :source ~/.vimrc<CR>"
