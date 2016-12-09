set nocompatible
filetype off


" vundle related stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" put plugins here...
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Rust settings
"
let g:rustfmt_autosave = 1
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" YCM settings
"
let g:ycm_confirm_extra_conf = 0
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
syntax enable
syntax on
set ruler
set autoread
set hi=5000
set tags=./tags;/

colorscheme elflord

set ts=4
set sw=4
set autoindent
