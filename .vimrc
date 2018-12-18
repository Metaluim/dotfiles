set nocompatible
filetype off


" vundle related stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" put plugins here...
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
"Plugin 'rust-lang/rust.vim'
Plugin 'noah/vim256-color'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-airline settings
"
let g:airline#extensions#tabline#enabled = 1
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" syntastic settings
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" javacsript linter
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
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

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set hidden

set nu
autocmd filetype cpp set ts=2 sw=2 backspace=2 softtabstop=2
autocmd filetype javascript set ts=4 sw=4 softtabstop=4
set expandtab

map <C-n> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

let mapleader = ","
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
