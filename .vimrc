
"-----------------------------
" Pluging config
" ---------------------------
call plug#begin('~/.vim/plugged')

Plug 'sbdchd/neoformat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'git@github.com:ajh17/VimCompletesMe.git'
Plug 'morhetz/gruvbox'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'valloric/youcompleteme'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'git@github.com:rking/ag.vim.git'
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'KeitaNakamura/neodark.vim'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'

call plug#end()

"packadd! onedark.vim

let g:neodark#background = '#202021'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_auto_sameids = 1

"vim-go settings
au filetype go inoremap <buffer> . .<C-x><C-o>

syntax on
colorscheme neodark
set termguicolors
"set t_Co=256
"-----------------------------
" Key mappings
" ---------------------------
let mapleader = " "
"-----------------------------
" Autocomplete closing brackets
" ---------------------------
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>0
inoremap {;<CR> {<CR>};<ESC>0


inoremap jk <Esc>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nmap Q <Nop>

"-----------------------------
" Basic editing config
" ---------------------------

filetype plugin indent on "enable file type detection
set autoindent
set history=8848 "more history
set nojoinspaces " supress inserting two spaces between sentences

set hls
set number
set relativenumber
set incsearch
set smartcase
"syntax enable
set showmatch " show matching braces when text indicator is over them

"-----------------------------
" Nerd tree config
" ---------------------------
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" Auto quit nerdtree if last one buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" quicker window movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


nnoremap <leader>u :UndotreeShow<CR>

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>


let g:ctrlp_use_caching = 0
" Move single lines
nmap <C-k> <Alt-k>
nmap <C-j> <Alt-j>
vmap <C-k> [egv
" Move multiple lines
vmap <C-j> ]egv

" beautify js codes"
" "autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
"
" On pressing tab, insert 2 spaces
set expandtab
set tabstop=2
set softtabstop=2

" Use CTR-S for saving, also in Insert mode
noremap <C-s> :update<CR>

" TextEdit might fail if hidden is not set
set hidden

" Give more space for displaying message
set cmdheight=2

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" write the content of the file automatically in you call :make
set autowrite
