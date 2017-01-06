filetype off
set nocompatible

set rtp+=~/.vim/plugin/Vundle.vim

call vundle#begin('~/.vim/plugin')
" vundle "
Plugin 'VundleVim/Vundle.vim'

" IDE features "
Plugin 'scrooloose/nerdtree'
Plugin 'TabBar'
Plugin 'Tagbar'
Plugin 'linepower.vim'

" c-cpp auto complete "
Plugin 'OmniCppComplete'

" C-lang features "
Plugin 'vim-cpp-auto-include'

" Python-lang fearture "
Plugin 'PyChimp'

" Ack.vim just like grep and grepadd "
Plugin 'ack.vim'

""
Plugin 'SuperTab'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'davidhalter/jedi-vim'

call vundle#end()

filetype plugin indent on
