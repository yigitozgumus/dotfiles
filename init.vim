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
Plug 'derekwyatt/vim-scala'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'junegunn/vim-easy-align'
Plug 'ambv/black'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'drewtempelmeyer/palenight.vim'"
"Plug 'lervag/vimtex'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'flrnprz/plastic.vim'
Plug 'sainnhe/vim-color-forest-night'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Core Settings File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:so /Users/${USER}/.vimrc.core

" Fast reloading for configuration change 
map <leader>rr :source ~/.config/nvim/init.vim<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme gruvbox
"colorscheme palenight
set termguicolors
let ayucolor="dark"
colorscheme palenight
" Python Settings"
let g:deoplete#auto_complete_delay = 100
let g:black_linelength = 100
" Airline theme additions
let g:jsx_ext_required = 1
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
"let g:tex_flavor = 'latex'
"let g:vimtex_view_method='skim'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

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
" COC-VIM

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR><Paste>
let g:airline#extensions#tabline#enabled = 1
