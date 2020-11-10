set nocompatible

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
       call dein#begin('~/.vim/dein')
       call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
       call dein#add('rhysd/vim-llvm')
       call dein#add('vmchale/ats-vim')
       call dein#end()
       call dein#save_state()
endif

" install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif



"colo mc
colo peachy
syntax enable

set termguicolors

filetype plugin indent on
" Zig is stupid and disallows '\t' as a character in source code
au bufnewfile,bufread *.zig set shiftwidth=8 softtabstop=8 ",set noexpandtab
au bufnewfile,bufread *.hs set shiftwidth=8 softtabstop=8 expandtab
au bufnewfile,bufread *.fs set shiftwidth=8 softtabstop=4 expandtab
au bufnewfile,bufread *.rs set shiftwidth=8 tabstop=8 noexpandtab
au bufnewfile,bufread *.tex filetype plugin indent off
au bufnewfile,bufread *.mofl set ft=mofl
au bufnewfile,bufread *.clht set ft=clht
au bufnewfile,bufread fancy.build set ft=lisp
au bufnewfile,bufread *.asd set ft=lisp
"au bufnewfile,bufread *.c,*.h set ft=aplc
"autocmd BufNewFile,BufRead *.nim set tabstop=4 expandtab shiftwidth=4 softtabstop=4
au bufnewfile,bufread *.h set ft=c
autocmd bufnewfile,bufread *.scm,*.lisp,*.el,*.clht set tabstop=1 expandtab shiftwidth=1 softtabstop=1
" No autocomplete in .tex files because just no
autocmd bufnewfile,bufread *.tex let g:ycm_auto_trigger=0

let g:c_no_curly_error = 1

set noexpandtab
set hlsearch
set noincsearch

" search terms are highlighted blue, rather than a blinding bright yellow
hi search ctermbg=blue guibg=#330066

hi visual guibg=#222222
hi cursorline cterm=none gui=none guibg=#222222
set cursorline

set directory=.  " swapfiles in cwd
set backspace=indent,eol,start
set showmode
set ruler
set laststatus=2
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev WQ wq
cabbrev Wn wn
cabbrev WN wn

" on a trackpad, I often 'scroll' accidentally, which is disorienting.  This
" makes that not do anything
noremap <Up> <NOP>
noremap <Down> <NOP>

noremap  <silent> <C-C> :let @/ = ""<CR>
inoremap <silent> <C-C> <C-o>:let @/ = ""<CR>
vnoremap <silent> <C-C> :let @/ = ""<CR>
nnoremap <silent> <C-C> :let @/ = ""<CR>

let g:lisp_rainbow=1

set timeoutlen=0
set ttimeoutlen=0
set notimeout
set ttimeout

if $SCREEN_RUNNING
	set t_ts=k
	set t_fs=\

	" reset title to zsh upon exiting
	" so it doesn't get set to 'thanks for flying vim'
	auto VimLeave * :set t_ts=kzsh\
endif

if !empty($TMUX)
	call system('tmux rename-window ' . expand('%:t'))
	"TODO stash old win name
	"run tmux display-message -p '#W'
endif

let &titlestring = expand("%:t")
set title

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set guicursor+=n-v-c:blinkon0
