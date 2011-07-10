syntax on
syntax sync fromstart
set background=dark
set nocompatible " not compatible with the old-fashion vi mode
set bs=2 " allow backspacing over everything in insert mode
set history=200 " keep 50 lines of command line history
set ruler " show the cursor position all the time
set autoread " auto read when file is changed from outside
set ruler
set showcmd
set laststatus=2
set cursorline      

set showmatch
set matchtime=2
set incsearch
set ignorecase
set smartcase
set nohls

set autoindent
set preserveindent
set nosmartindent
set smarttab
set expandtab
set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions=croqn2
set lbr

set foldmethod=indent
set nofoldenable
set shellcmdflag=-c
set modeline
set modelines=5
set splitright splitbelow
set scrolloff=3
set nomore
set wildmenu
set wildmode=list:longest
set backspace=indent,eol,start
set tabpagemax=100
set switchbuf=usetab

" Jump to last known location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Filetype based indent rules
if has("autocmd")
  filetype indent plugin on
endif
" MacVim
if has("gui_macvim")
    set transparency=5
    set guifont=Inconsolata:h14
    set lines=60
    set formatoptions-=t
    set formatoptions-=c
    set paste
endif

autocmd BufNewFile,BufRead *.txt,*.mdwn,*.mkd,*.md setlocal filetype=mkd
autocmd FileType mkd setlocal ai comments=n:> spell

" ReST
autocmd BufNewFile,BufRead *.rst,*.rest setlocal filetype=rest
autocmd FileType rest setlocal ai comments=n:> spell

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

" No more need to drop modelines into common Apache files
" (both Debian and RedHat style Apache conf dirs)
autocmd BufNewFile,BufRead /etc/apache2/*,/etc/httpd/* setlocal filetype=apache

" Same for nginx
autocmd BufNewFile,BufRead */etc/nginx/* setlocal ft=nginx

" Drupal
autocmd BufNewFile,BufRead *.module setlocal ft=php

" JSON
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

let mapleader=" "

nmap <Leader><CR> o<Esc>
nmap <Leader>[ :tabp<CR>
nmap <Leader>] :tabn<CR>
nmap <Leader><Left> <C-w><Left>
nmap <Leader><Right> <C-w><Right>
nmap <Leader><Up> <C-w><Up>
nmap <Leader><Down> <C-w><Down>

" Paragraph formatting
nmap <Leader>f gqap
vmap <Leader>f gq

" :w shortcut
nmap <Leader>s :w<CR>
map <up> gk
inoremap <up> <C-R>=pumvisible() ? "\<lt>up>" : "\<lt>C-o>gk"<Enter>
map <down> gj
inoremap <down> <C-R>=pumvisible() ? "\<lt>down>" : "\<lt>C-o>gj"<Enter>

" Default to tree view 
let g:netrw_liststyle = 3
let g:netrw_list_hide = '.*\.py[co]$,\.git$,\.swp$'
let g:netrw_http_cmd = "wget -q -O" " or 'curl -Ls -o'

function! AskQuit (msg, proposed_action)
    if confirm(a:msg, a:proposed_action . "\n&Quit?") == 2
        exit
    endif
endfunction
