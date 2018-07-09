set nocompatible
filetype off


" vundle related stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" put plugins here...
Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
"Plugin 'rust-lang/rust.vim'
Plugin 'noah/vim256-color'
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

set t_Co=256
"colorscheme elflord
colorscheme jellybeans
set cursorline

set nu
set ts=2
set sw=2
set backspace=2
set softtabstop=2
"set smartindent
"set cindent
"set cinoptions=g0:0t0c2C1(0f0l1
set expandtab

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>

if isdirectory($HOME . "/.vim/site_specific")
  if filereadable($HOME . "/.vim/site_specific/.site_vimrc")
    source ~/.vim/site_specific/.site_vimrc
  endif
endif
