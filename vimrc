set nocompatible
syntax enable
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
	call dein#begin('~/.vim/dein')
	call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

	"call dein#add('ycm-core/YouCompleteMe', {'merged': 0})
	call dein#add('vim-perl/vim-perl6')
	"call dein#add('tpope/vim-surround.git')
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	call dein#add('tpope/vim-rsi') "readline shortcuts on :-commandline
	call dein#add('cespare/vim-toml')
	call dein#add('javier-lopez/sprunge.vim')
	call dein#add('tikhomirov/vim-glsl')
	"call dein#add('tpope/vim-abolish')
	call dein#add('vim/killersheep')
	call dein#add('itchyny/vim-haskell-indent')
	"call dein#add('zxqfl/tabnine-vim')
	"
	"call dein#add('fsharp/vim-fsharp')
	call dein#add('kongo2002/fsharp-vim')


	call dein#end()
	call dein#save_state()
endif

" install not installed plugins on startup.
if dein#check_install()
	call dein#install()
endif


"call dein#add('tpope/vim-fugitive.git') " git support
"call dein#add('ctrlpvim/ctrlp.vim')     " fuzzy file search, like fzf
"call dein#add('scrooloose/syntastic')   " linting
"call dein#add('terryma/vim-multiple-cursors')
"call dein#add('Shougo/neocomplete.vim') " completion
"call dein#add('Valloric/YouCompleteMe') " ditto
"call dein#add('aserebryakov/vim-todo-lists')
"
" various languages:
"call dein#add('jfecher/ante_vim')
"call dein#add('udalov/kotlin-vim')
"call dein#add('jrozner/vim-antlr')
"call dein#add('zah/nim.vim')
"call dein#add('kovisoft/slimv')         " lisp, modeled after SLIME
"call dein#add('quabug/vim-gdscript')
"call dein#add('ziglang/zig.vim')



colorscheme peachpuff

filetype plugin indent on
" Zig is stupid and disallows '\t' as a character in source code
au bufnewfile,bufread *.zig set shiftwidth=8 softtabstop=8 ",set noexpandtab
au bufnewfile,bufread *.hs set shiftwidth=8 softtabstop=8 expandtab
au bufnewfile,bufread *.fs set shiftwidth=8 softtabstop=4 expandtab
au bufnewfile,bufread *.rs set shiftwidth=8 tabstop=8 noexpandtab
au bufnewfile,bufread *.tex filetype plugin indent off
"au bufnewfile,bufread *.txt set textwidth=78
"
set noexpandtab
set hlsearch

" search terms are highlighted blue, rather than a blinding bright yellow
hi Search cterm=NONE ctermbg=blue

" highlight the entirety of the current line dark gray
hi CursorLine cterm=none ctermbg=234
set cursorline

set directory=.  " Put swapfiles in cwd
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

"autocmd BufNewFile,BufRead *.nim set tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.h set ft=c
autocmd BufNewFile,BufRead *.scm,*.lisp,*.el set tabstop=8 expandtab shiftwidth=8 softtabstop=8


" No autocomplete in .tex files because just no
autocmd BufNewFile,BufRead *.tex let g:ycm_auto_trigger=0

" on a trackpad, I often 'scroll' accidentally, which is disorienting.  This
" makes that not do anything
noremap <Up> <NOP>
noremap <Down> <NOP>

noremap  <silent> <C-C> :let @/ = ""<CR>
inoremap <silent> <C-C> <C-o>:let @/ = ""<CR>
vnoremap <silent> <C-C> :let @/ = ""<CR>
nnoremap <silent> <C-C> :let @/ = ""<CR>

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0

"let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0

let g:airline_powerline_fonts = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
let g:paredit_mode=0
let g:lisp_rainbow=1
let g:airline#extensions#whitespace#enabled = 0

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

let &titlestring = expand("%:t")
set title
