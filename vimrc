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


set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"set tabstop=4 expandtab shiftwidth=4 softtabstop=4
