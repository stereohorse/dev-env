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


" vue
Plugin 'posva/vim-vue'


" markdown
Plugin 'suan/vim-instant-markdown'


" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-dispatch'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Bundle 'venantius/vim-cljfmt'


" solidity
Plugin 'tomlion/vim-solidity'


" js
Plugin 'ternjs/tern_for_vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'


" python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'


" vcs
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


" search
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'jeetsukumaran/vim-filebeagle'

" files tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'


" colors
Plugin 'flazz/vim-colorschemes'
Plugin 'w0ng/vim-hybrid'


" status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" general
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tpope/vim-sensible'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'wakatime/vim-wakatime'


" writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'


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

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid

set nofoldenable 
set hidden

" line numbers
set relativenumber

filetype plugin indent on

" buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" hardmode!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='jellybeans'

" clipboard
set clipboard=unnamed

" nerdtree
nnoremap <F8> :NERDTree<CR>
nmap <silent> <F5> :NERDTreeToggle<CR>

" fzf
set rtp+=/usr/local/opt/fzf


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


" syntax rules
au BufReadPost *.json.j2 set syntax=json


" -------
" clojure
" -------

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" -----
" OCaml
" -----

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

set rtp^="/Users/stereohorse/.opam/system/share/ocp-indent/vim"


" ----------
" promptline
" ----------

let g:promptline_preset = {
      \'b':    [ '$(echo ${PWD##*/})' ],
      \'x':    [ promptline#slices#python_virtualenv() ],
      \'y':    [ promptline#slices#git_status() ],
      \'z':    [ promptline#slices#vcs_branch() ],
      \'warn': [ promptline#slices#last_exit_code() ]}


" --------------------
" per-project settings
" --------------------

set exrc
set secure


" -----
" emmet
" -----

let g:user_emmet_install_global = 0
autocmd FileType html,css,vue,jsx EmmetInstall


" ----
" goyo
" ----

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
