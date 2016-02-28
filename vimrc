" Mouse
set mouse=a
set mousehide 

" Backspace delete
set backspace=2

" Tab options
set expandtab 
set tabstop=2
set shiftwidth=2

" Invisible charater
set list listchars=tab:»·,trail:·
:set list

" Automatically trim whitespace on save
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Syntax
filetype plugin indent on
syntax on 

" Numbers
set number
set numberwidth=3
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Color scheme
set background=dark
let base16colorspace=256
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Other useful config
set ruler
set laststatus=2
set showmatch
