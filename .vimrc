syntax on
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
inoremap , , <c-g>u
inoremap . . <c-g>u
inoremap ! ! <c-g>u
inoremap ? ? <c-g>u
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Vim Plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdtree'
call plug#end()
colorscheme dracula 
set background =dark
set spell
" open NerdTree automatically
autocmd VimEnter * NERDTree

set relativenumber
set scrolloff=8
