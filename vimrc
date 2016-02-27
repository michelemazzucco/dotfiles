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
:set listchars=tab:>-,trail:.,extends:>,precedes:<
:set list

" Automatically trim whitespace on save
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Syntax
filetype plugin indent on
syntax on 

" Other useful config
set ruler
set laststatus=2
set nu
set showmatch
