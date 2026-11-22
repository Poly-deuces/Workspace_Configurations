call plug#begin('~/.vim/plugged')

Plug 'git@github.com:tpope/vim-surround.git'
Plug 'git@github.com:tpope/vim-commentary.git'
Plug 'git@github.com:tpope/vim-fugitive.git'
Plug 'git@github.com:airblade/vim-gitgutter.git'

Plug 'git@github.com:junegunn/fzf.git', { 'do': { -> fzf#install() } }
Plug 'git@github.com:junegunn/fzf.vim.git'

Plug 'git@github.com:vim-airline/vim-airline.git'
Plug 'git@github.com:vim-airline/vim-airline-themes.git'

Plug 'git@github.com:preservim/nerdtree.git'
Plug 'git@github.com:majutsushi/tagbar.git'

Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

set wildmenu
set wildmode=full
set clipboard=unnamed

set nocompatible

set regexpengine=0

filetype plugin on
filetype indent on
syntax on

set number
set showmatch
set laststatus=2
set scrolloff=0

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start

set ignorecase
set smartcase
set incsearch
set hlsearch

set autoread
set confirm
set hidden
set undofile
set undodir=~/.vim/undo

set splitright
set splitbelow

autocmd FileType c,cpp setlocal cinoptions=:0,(0,l1,t0,W2s,N-s,E-s,g0
set fileencodings=utf-8,latin-1,gb18030,gbk,gb2312 encoding=utf-8 langmenu=none
set notitle ruler modeline modelines=6 belloff=all
set nostartofline jumpoptions=stack
set numberwidth=9 norelativenumber signcolumn=yes
set completeopt=menuone,noinsert,preview
highlight SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight Error NONE
language C

let g:markdown_recommended_style = 0
let g:asyncomplete_auto_completeopt = 0
let g:lsp_diagnostics_enabled = 1

inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

silent! source ~/.lsp.vim

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
