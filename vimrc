syntax on
let g:airline_powerline_fonts = 1
syntax sync fromstart
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'
Plugin 'MarkDown'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'

Bundle 'klen/python-mode'

" Now we can turn our filetype functionality back on
filetype plugin indent on

set background=dark
set bs=2 " allow backspacing over everything in insert mode
set history=200 " keep 200 lines of command line history
set ruler " show the cursor position all the time
set autoread " auto read when file is changed from outside
set showcmd " current command
set laststatus=2 " show status bar 
set showmatch
set matchtime=2
set incsearch
set ignorecase
set smartcase
set nohls " no highlight search
set autoindent
set nosmartindent
set smarttab
set expandtab

set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set formatoptions=croqn2
set lbr

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

map <F2> :NERDTreeToggle<CR>
map <F3> :set invnumber<CR>
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
let g:pymode_options_colorcolumn = 0
set wildmenu " press tab for match
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

colorscheme ir_black
let g:airline_theme='murmur'
