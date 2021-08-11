set nocompatible
filetype off

call plug#begin()

" put plugins here...
Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'noah/vim256-color'
Plug 'Valloric/ListToggle'
Plug 'tyru/current-func-info.vim'
Plug 'preservim/tagbar'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dominikduda/vim_current_word'
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tommcdo/vim-kangaroo'
Plug 'powerman/vim-plugin-ansiesc'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

filetype plugin indent on
syntax enable
syntax on
set ruler
set autoread
set hi=5000
set tags=./tags;/

"let t_Co=256
set termguicolors
colorscheme jellybeans
set cursorline
highlight ColorColumn ctermbg=black

set undolevels=1000
set undoreload=10000
set hidden
set encoding=utf-8
set secure exrc
set nu
set expandtab
set jumpoptions+=stack

map <C-n> :NERDTreeToggle<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

au BufNewFile,BufRead *.i set filetype=swig
au BufNewFile,BufRead *.swg set filetype=swig
au BufNewFile,BufRead *.swig set filetype=swig

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
let g:cpp_posix_standard = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Tagbar settings
"
nnoremap <C-k> :TagbarToggle<CR>
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
set noshowmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" LSP settings
"
highlight LspDiagnosticsDefaultError ctermfg=red cterm=undercurl

lua <<EOF

local nvim_lsp = require('lspconfig');

local map = function(type, key, value)
        vim.api.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 3;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.s_tab_complete()", {expr = true})

local custom_attach = function(client, bufnr)
	print("LSP started.");
	require'completion'.on_attach(client)

        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	--map('n',',gf','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','<leader>gf','<cmd>lua vim.lsp.buf.definition()<CR>')
	map('n','<leader>gl','<cmd>lua vim.lsp.buf.implementation()<CR>')
	-- map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>gg','<cmd>lua vim.lsp.buf.references()<CR>')
	--map('n','<leader>gT','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	--map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','<leader>t','<cmd>lua vim.lsp.buf.hover()<CR>')
	--map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	--map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	--map('n','<leader>d','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	--map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	--map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
	--map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>D','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
	map('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
nvim_lsp.clangd.setup{
        capabilities = capabilities,
        on_attach = custom_attach
}

EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" fzf settings
"
"source ~/.fzf/plugin/fzf.vim
"source ~/source/fzf_vim_plugin/plugin/fzf.vim
let g:fzf_layout = { 'down': '30%' }
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

