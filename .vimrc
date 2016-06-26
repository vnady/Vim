" Display line numbers on the left
set number

" Enable use of the mouse 
set mouse=a

" Indentation settings according to personal preference.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" display the status line, even if only one window is displayed
set laststatus=2

" set the command window height to 2 lines, to avoid many cases of having to
" press <Enter> to continue
set cmdheight=1

" Allow case insensitive search, except when using capital letters.
set ignorecase
set smartcase

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Enable syntax highlighting
syntax on

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Auto_Open=1

"Press F5 to compile"
map <F5> :call CompileRunGcc()<cr>
func CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! %<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! %<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "! %<"
	elseif &filetype == 'sh'
		:! ./%
	elseif &filetype == 'python'
		exec "!python %"
	endif
endfunc

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
if exists('$TMUX')
    set term=screen-256color
endif
