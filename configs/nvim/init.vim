" Fundamentals "{{{
" ---------------------------------------------------------------------



" Enables us Vim specific features
set nocompatible                
" Reset filetype detection first ...
filetype off                    
" Indicate fast terminal conn for faster redraw
filetype plugin indent on       
" Indicate fast terminal conn for faster redraw
set ttyfast                     
" Show status line always
set laststatus=2                
" Set default encoding to UTF-8
set encoding=utf-8              
" Automatically read changed files
set autoread                    
" Enabile Autoindent
set autoindent                  
" Makes backspace key more powerful.
set backspace=indent,eol,start  
" Shows the match while typing
set incsearch                   
" Highlight found searches
set hlsearch                    
" No beeps
set noerrorbells                
" Show line numbers
set number relativenumber        
" Show me what I'm typing
set showcmd                     
" Don't use swapfile
set noswapfile                  
" Don't create annoying backup files
set nobackup                    
" Vertical windows should be split to right
set splitright                  
" Horizontal windows should split to bottom
set splitbelow                  
" Automatically save before :next, :make etc.
set autowrite                   
" Buffer should still exist if window is closed
set hidden                      
" Prefer Unix over Windows over OS 9 formats
set fileformats=unix,dos,mac    
" Do not show matching brackets by flickering
set noshowmatch                 
" We show the mode with airline or lightline
set noshowmode                  
" Search case insensitive...
set ignorecase                  
" ... but not it begins with upper case
set smartcase                   
" Show popup menu, even if there is one entry
set completeopt=menu,menuone    
" Completion window max size
set pumheight=10                
" Do not highlight column (speeds up highlighting)
set nocursorcolumn              
" Do not highlight cursor (speeds up highlighting)
set nocursorline                
" Wait to redraw
set lazyredraw                 


"}}}

" Highlights "{{{
" ----------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif
if has('win32')
  runtime ./windows.vim
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  colorscheme gruvbox
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" vim: set foldmethod=marker foldlevel=0:
