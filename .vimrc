set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'danilo-augusto/vim-afterglow'
Plugin 'neoclide/coc.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'yggdroot/indentline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'vhdirk/vim-cmake'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'instant-markdown/vim-instant-markdown', {'rtp': 'after'}

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
colorscheme afterglow

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

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-prettier' ]

nmap <leader>d <Plug>(coc-codeaction)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)


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
