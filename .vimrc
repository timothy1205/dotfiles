set nocompatible
filetype off

"test
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danilo-augusto/vim-afterglow'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'vhdirk/vim-cmake'
Plug 'pboettch/vim-cmake-syntax'
Plug 'instant-markdown/vim-instant-markdown', {'rtp': 'after'}
"Requires arch package 'the_silver_searcher' for Ag
Plug 'junegunn/fzf.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'Stoozy/vimcord'

call plug#end()

filetype plugin indent on


set number	
set linebreak	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell	
set relativenumber
 
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
set cmdheight=2

set updatetime=300

set ruler	
 
set undolevels=1000	
set backspace=indent,eol,start

set scrolloff=5

set guioptions-=L

set encoding=utf-8

syntax on
set background=dark

colorscheme gruvbox
"colorscheme Atelier_DuneDark
" Darker background/line number background
" https://static.wikia.nocookie.net/vim/images/1/16/Xterm-color-table.png/revision/latest/scale-to-width-down/900?cb=20110121055231
"hi Normal ctermbg=Black
"hi LineNr ctermbg=16
hi PMenu ctermfg=147 ctermbg=16

"control + h/j/k/l will move around the windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

"send to blackhole register by default
nnoremap d "_d
nnoremap x "_x
nnoremap <C-p> "0p

"prevent pasting in visual mode from overriding default register
xnoremap p pgvy

nnoremap : ;
nnoremap ; :

" Swap ` and ' for marks
nnoremap ' `
nnoremap ` '

" Search and replace highlighted text (visual mode)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"autoclose vim if only NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ctrl + n to toggle 
nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap <C-f> :Ag<CR>

"enable rainbow parentheses
let g:rainbow_active = 1
let g:rainbow_conf = { 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'] }

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-prettier', 'coc-xml', 'coc-yaml', 'coc-java', 'coc-clangd', 'coc-css', 'coc-html', 'coc-cmake', 'coc-sh', 'coc-highlight', 'coc-pyright' ]

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
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>r <Plug>(coc-rename)
nnoremap <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=99
