"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOVIM Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'SirVer/ultisnips'
Plug 'brooth/far.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'junegunn/vim-easy-align'
Plug 'ambv/black'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'drewtempelmeyer/palenight.vim'"
Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi',
Plug 'davidhalter/jedi-vim',
Plug 'honza/vim-snippets'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
Plug 'rust-lang/rust.vim'
Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Settings File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:so /Users/yigitozgumus/.vimrc.core

" Fast reloading for configuration change 
map <leader>rr :source ~/.config/nvim/init.vim<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python Settings"
let g:deoplete#auto_complete_delay = 100
let g:black_linelength = 100
" Airline theme additions
let g:airline_powerline_fonts = 1
" Vim Node 
" Ulti snips configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Markdown configuration regarding latex
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2

" Latex Settings
let g:tex_flavor = 'latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" COlorscheme settings
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:semshi#no_default_builtin_highlight = 0
let g:python_highlight_all = 1
nnoremap <silent>  <leader>b :ls<cr>:b<space>
nnoremap <silent> <leader>t :TagbarToggle<CR>
let g:highlighter#syntax_python = [
      \ { 'hlgroup'       : 'HighlighterPythonFunction',
      \   'hlgroup_link'  : 'Function',
      \   'tagkinds'      : 'f',
      \   'syntax_type'   : 'match',
      \   'syntax_suffix' : '(\@=',
      \ },
      \ { 'hlgroup'       : 'HighlighterPythonMethod',
      \   'hlgroup_link'  : 'Function',
      \   'tagkinds'      : 'm',
      \   'syntax_type'   : 'match',
      \   'syntax_prefix' : '\.\@<=',
      \ },
      \ { 'hlgroup'       : 'HighlighterPythonClass',
      \   'hlgroup_link'  : 'Type',
      \   'tagkinds'      : 'c',
      \ }]
