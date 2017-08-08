set runtimepath+=/home/elronnd/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/home/elronnd/.vim/dein')
call dein#add('Shougo/dein.vim')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-surround.git')
call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-abolish')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-rsi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('jfecher/ante_vim')
call dein#add('udalov/kotlin-vim')
call dein#add('vim-syntastic/syntastic')
call dein#add('jrozner/vim-antlr')
call dein#add('zah/nim.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Valloric/YouCompleteMe')
call dein#end()
syn on

" install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colo peachpuff

filetype plugin on
set noexpandtab
set nocompatible
hi Search ctermbg=10
set backspace=indent,eol,start
set showmode
set ruler
set backspace=indent,eol,start
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev WQ wq
cabbrev w1 w!
cabbrev q1 q!
cabbrev wq1 wq!
cabbrev Wn wn
cabbrev WN wn

autocmd BufNewFile,BufRead *.nim set tabstop=4 expandtab shiftwidth=4 softtabstop=4

set laststatus=2

let g:neocomplete#enable_at_startup = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:airline#extensions#whitespace#enabled = 0

" Disable notes in syntastic.  Ordinarily I'd keep them, as warnings, but gcc
" keeps bitching about how the ABI changed 3 major versions ago and I really
" don't care.
let g:syntastic_c_errorformat =
    \ '%-G%f:%s:,' .
    \ '%f:%l:%c: %trror: %m,' .
    \ '%f:%l:%c: %tarning: %m,' .
    \ '%W%f:%l: note: %m,' .
    \ '%f:%l:%c: %m,' .
    \ '%f:%l: %trror: %m,' .
    \ '%f:%l: %tarning: %m,' .
    \ '%f:%l: %m'
