" ----------------
" configure Vundle
" ----------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" syntax
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'


" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'


" vcs
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" search
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'


" files tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'


" colors
Plugin 'flazz/vim-colorschemes'


" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Bundle 'edkolev/tmuxline.vim'


" vundle
Plugin 'VundleVim/Vundle.vim'


call vundle#end()
filetype plugin indent on


" ---
" l&f
" ---

set backspace=indent,eol,start
set laststatus=2
set number

"syntax on
filetype plugin indent on


" ---------------
" silver_searcher
" ---------------

let g:ackprg = 'ag --nogroup --nocolor --column'


" ------
" syntax
" ------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" -------
" clojure
" -------

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
