set runtimepath+=/home/elronnd/.vim/dein/repos/github.com/Shougo/dein.vim
call dein#begin('/home/elronnd/.vim/dein')
call dein#add('Shougo/dein.vim')
"call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-surround.git')
"call dein#add('scrooloose/syntastic')
call dein#add('tpope/vim-abolish')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tpope/vim-rsi')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('jfecher/ante_vim')
call dein#add('udalov/kotlin-vim')
call dein#add('jrozner/vim-antlr')
call dein#add('zah/nim.vim')
"call dein#add('Shougo/neocomplete.vim')
"call dein#add('Valloric/YouCompleteMe')
call dein#add('aserebryakov/vim-todo-lists')
call dein#add('cespare/vim-toml')
call dein#add('kovisoft/slimv')
call dein#add('javier-lopez/sprunge.vim')
call dein#add('quabug/vim-gdscript')
call dein#end()
syn on

" install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

colorscheme peachpuff

"filetype plugin on
filetype plugin indent off
set noexpandtab
set nocompatible
set hlsearch
hi Search cterm=NONE ctermbg=blue
hi CursorLine cterm=none ctermbg=234
set cursorline
set backspace=indent,eol,start
set showmode
set ruler
set laststatus=2
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

"autocmd BufNewFile,BufRead *.nim set tabstop=4 expandtab shiftwidth=4 softtabstop=4

noremap <Up> <NOP>
noremap <Down> <NOP>

let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:paredit_mode=0
let g:lisp_rainbow=1
"let g:airline#extensions#whitespace#enabled = 0

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
