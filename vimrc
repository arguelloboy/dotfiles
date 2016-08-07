" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Lokaltog/vim-distinguished' " Color scheme
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'michaeljsmith/vim-indent-object'

call vundle#end()
filetype plugin indent on

set history=500
let mapleader = ","
let g:mapleader = ","
nmap <leader>w :w!<cr>
set so=7
set wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler
set cmdheight=2
set hid " TODO CHECK
set backspace=eol,start,indent " TODO check
set whichwrap+=<,>,h,l " TODO check
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2 " TODO check
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
syntax enable 
set background=dark
set encoding=utf8
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Specify the behavior when switching between buffers TODO check
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position when opening files
set laststatus=2
map <leader>e :e! ~/.vimrc<cr>

" TODO check
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
let g:syntastic_python_checkers=['pyflakes'] " Syntastic

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

inoremap jk <Esc>
inoremap kj <Esc>
inoremap <Esc> <Nop>
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
set relativenumber
set number
set gdefault
" Highlights trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set clipboard=unnamed " Note: May want to change to unnamedplus
nnoremap <expr> <leader>q OpenTmp()
function! OpenTmp()
    return ":e" . system("mktemp") . "\n"
endfunc
set mouse=nvc
colorscheme distinguished
