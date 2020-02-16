set nocompatible
filetype off


" vundle related stuff
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/source/fzf
call vundle#begin()

" put plugins here...
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'noah/vim256-color'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
Plugin 'junegunn/fzf.vim'
Plugin 'tyru/current-func-info.vim'
Plugin 'Tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'dominikduda/vim_current_word'
Plugin 'Chiel92/vim-autoformat'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tommcdo/vim-kangaroo'

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
filetype plugin indent on
syntax enable
syntax on
set ruler
set autoread
set hi=5000
set tags=./tags;/

set t_Co=256
colorscheme jellybeans
set cursorline
highlight ColorColumn ctermbg=black

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set hidden

set nu
set expandtab

map <C-n> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

let mapleader = ","

if isdirectory($HOME . "/.vim/site_specific")
  if filereadable($HOME . "/.vim/site_specific/.site_vimrc")
    source ~/.vim/site_specific/.site_vimrc
  endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim_current_word settings
"
hi CurrentWord ctermbg = 236
hi CurrentWordTwins ctermbg = 235
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" cpp enhanced highlight settings
"
let g:cpp_class_scope_highlight = 1
let g:cpp_class_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Tagbar settings
"
nnoremap <C-k> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" YCM settings
"
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>C :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>D :YcmDiags<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>i :YcmCompleter GoToInclude<CR>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" ListToggle settings
"
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-airline settings
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" fzf settings
"
let g:rg_command = '
      \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
      \ -g "*.{cpp,cc,h,C,cxx,H,hxx,hpp,c,java}"
      \ -g "!{.git,node_modules,vendor,compile_commands.*}/*" '
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
nnoremap K :F <CR>expand(<cword>)<CR>
nnoremap K :call fzf#vim#grep(g:rg_command . ' -w ' . expand('<cword>'), 1, 0)<CR>
nnoremap <leader>j :BTags<CR>
nnoremap <C-p> :FZF<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
