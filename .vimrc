source ~/.vim/bundle.vim

" general " {{{

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" Enable syntax highlighting
syntax enable
syntax on

" Display line numbers on the left
"
set number
set autoread " autoread when edited by other editer
set cursorline " show line the cursor at "
set autowriteall " auto save "
set clipboard=unnamed " use the system clipboard "
set nobackup
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
set nohlsearch

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" dont wrap lines
set nowrap

" 5 lines above/below cursor when scrolling
set scrolloff=5

" }}}

" Tlist and ctags " {{{
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Auto_Open=1
let Tlist_WinWidth=30

" " }}}

" func for compile "{{{
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

" " }}}

" setup for coding " {{{
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

" " }}}

" tmux " {{{
if exists('$TMUX')
    set term=screen-256color
endif
" " }}}

" TabBar " {{{
    let g:Tb_MaxSize = 2
    let g:Tb_TabWrap = 1
    
    hi Tb_Normal guifg=white ctermfg=white
    hi Tb_Changed guifg=green ctermfg=green
    hi Tb_VisibleNormal ctermbg=252 ctermfg=235
    hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" }}}

" Tagbar " {{{
    autocmd VimEnter * nested :TagbarOpen
    autocmd VimEnter * nested :call tagbar#autoopen(1)
    autocmd FileType * nested :call tagbar#autoopen(0)
    autocmd BufEnter * nested :call tagbar#autoopen(0)

    let g:tagbar_left=1
    let g:tagbar_width=30
    let g:tagbar_autofocus = 0
    let g:tagbar_sort = 0
    let g:tagbar_compact = 1

" }}}
" The-NERD-tree " {{{
    autocmd VimEnter * nested :NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
     
    map <C-n> :NERDTreeToggle<CR>
   
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let g:NERDTreeDirArrows = 1
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    
    let NERDTreeWinSize=30
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    " let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
    let NERDTreeShowBookmarks=1
    let NERDTreeWinPos = "right"

    " nerdcommenter
    let NERDSpaceDelims=1
    " nmap <D-/> :NERDComToggleComment<cr>
    let NERDCompactSexyComs=1

" }}}
"
" powerline " {{{
    " let g:Powerline_symbols = 'fancy'

" }}}

" Quickly edit/reload the vimrc file " {{{
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" Quickly Ack " {{{
    nnoremap <leader>a :Ack
" }}}
