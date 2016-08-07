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


" asciidoc
Plugin 'asciidoc/vim-asciidoc'


" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Bundle 'venantius/vim-cljfmt'


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


" general
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-sensible'


" l&f
Bundle 'edkolev/promptline.vim'
Bundle 'edkolev/tmuxline.vim'


" vundle
Plugin 'VundleVim/Vundle.vim'


call vundle#end()
filetype plugin indent on

runtime! plugin/sensible.vim


" ---
" l&f
" ---

set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab

" line numbers
set relativenumber

"syntax on
filetype plugin indent on

" hardmode!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='jellybeans'


" ---------------
" silver_searcher
" ---------------

let g:ackprg = 'ag --nogroup --nocolor --column'


" ------
" syntax
" ------

syntax off

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


" ----------
" promptline
" ----------

let g:promptline_preset = {
      \'b':    [ promptline#slices#cwd() ],
      \'x':    [ promptline#slices#git_status() ],
      \'y':    [ promptline#slices#vcs_branch() ],
      \'z':    [ '%*' ],
      \'warn': [ promptline#slices#last_exit_code() ]}
