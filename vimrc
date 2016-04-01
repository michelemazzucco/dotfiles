set nocompatible

" Syntax -------------------------------------------------------------
set t_Co=256
set background=dark
syntax on

" Directories -------------------------------------------------------------
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

" Basics -------------------------------------------------------------
set autoindent " Copying autoindent
set backspace=indent,eol,start
set diffopt=filler
set diffopt+=iwhite
set esckeys
set hidden
set history=1000 " Increase history from 20 default to 1000
set mouse=a " Enable mouse
set nowrap
set nu " Enable line numbers
set title
set noshowmode
set visualbell
set wildmenu

" Tabs
set smarttab
set softtabstop=2 

" Tab options
set expandtab 
set tabstop=2
set shiftwidth=2

" Invisible charater
set lcs=tab:›\ ,trail:·,nbsp:_
:set list

" Numbers
set numberwidth=3
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Other useful config
set ruler
set laststatus=2
set showmatch

" Quick shortcut
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
iabbrev aa λ

" Plugins -------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Utility
Plug 'YankRing.vim'

" Syntax
Plug 'JulesWang/css.vim'
Plug 'cakebaker/scss-syntax.vim'

" Theme
Plug 'easysid/mod8.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Plugins configuration -----------------------------------------------
colorscheme mod8 " T1
let g:airline_powerline_fonts = 1
