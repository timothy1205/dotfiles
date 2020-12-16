set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vhdirk/vim-cmake'
Plugin 'pboettch/vim-cmake-syntax'

call vundle#end()
filetype plugin indent on


set number	
set linebreak	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell	
 
set hlsearch	
set smartcase	
set ignorecase	
set incsearch	 
set autoindent	
set expandtab	
set shiftwidth=2
set smartindent	
set smarttab	
set softtabstop=0 

set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start

syntax on
set background=dark

let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")


"control + h/j/k/l will move around the windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"autoclose vim if only NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ctrl + n to toggle 
map <C-n> :NERDTreeToggle<CR>

"enable rainbow parentheses
let g:rainbow_active = 1
