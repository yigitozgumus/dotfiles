call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'brooth/far.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'honza/vim-snippets'
call plug#end()

let g:deoplete#enable_at_startup = 1
