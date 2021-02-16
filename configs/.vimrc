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
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'vim-python/python-syntax'
Plug 'drewtempelmeyer/palenight.vim'"
Plug 'rust-lang/rust.vim'
Plug 'udalov/kotlin-vim' 
Plug 'dracula/vim'
Plug 'ntk148v/vim-horizon'
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
"set ttymouse=xterm2             " Indicate terminal type for mouse codes
"set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number relativenumber        " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "hard"

" ChangeBackground changes the background mode based on macOS's `Appearance`
" setting. We also refresh the statusline colors to reflect the new mode.
function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark   " for dark version of theme
  else
    set background=light  " for light version of theme
  endif
  colorscheme gruvbox

  try
    execute "AirlineRefresh"
  catch
  endtry
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Fast saving"
nmap <leader>w :w!<cr>

" Fast reloading for configuration change 
map <leader>rr :source ~/.vimrc<CR>"

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1


set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases 
set incsearch " Makes search act like search in modern browsers
set magic     " For regular expressions turn magic on
set showmatch         " Show matching brackets when text indicator is over them
set mat=2             " How many tenths of a second to blink when matching brackets
set encoding=utf8       " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac " Use Unix as the standard file type
set autowrite
set foldcolumn=1   " Add a bit extra margin to the left

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


" Python
let g:python_highlight_all = 1
let g:pymode_lint_on_write = 0"   " Python mode lint check disable
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Enable folding with the spacebar
nnoremap <leader> za
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>hh :tabprevious<cr>
map <leader>ll :tabnext<cr>
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr> 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" NerdTree"
map <leader>e :NERDTreeToggle<CR>
nmap <leader>nt :NERDTreeFind<CR>


let g:NERDTreeNodeDelimiter = "\u00a0"
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" Goyo
let g:goyo_width=150
map <leader>gg :Goyo<cr>
function! s:goyo_enter()
""  silent !tmux set status off
""  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set number 
  set noshowmode
  set noshowcmd
  NERDTreeClose
  set scrolloff=999
  " ...
endfunction

function! s:goyo_leave()
  ""silent !tmux set status on
  ""silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"=====================================================
"===================== STATUSLINE ====================

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%Y-%m-%d %H:%M',
      \'z'    : ' #h',
      \'options' : {'status-justify' : 'left', 'status-position' : 'top'}}

let g:tmuxline_powerline_separators = 0




"Ultisnipts 
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""
" Jedi mode settings
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
let g:pymode_rope = 0
map <leader>m :Buffers<CR>
let g:polyglot_disabled = ['latex']
set tags=tags
let g:deoplete#enable_at_startup = 1

