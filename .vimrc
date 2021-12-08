syntax on

set noerrorbells
set novisualbell
set tm=500
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set wildmenu
set foldcolumn=1
set encoding=utf-8
"Always show current position
set ruler

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'valloric/youcompleteme'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'leafgarland/typescript-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dag/vim-fish'

call plug#end()

colorscheme nord

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split=2
let g:netrw_banner = 0

let g:ctrlp_use_caching = 0
let g:netrw_winsize = 25
let mapleader = " "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>h :wincmd Left<CR>
nnoremap <leader>j :wincmd Down<CR>
nnoremap <leader>k :wincmd Up<CR>
nnoremap <leader>l :wincmd Righ<CR>

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>


nnoremap <silent> <Leader>gd :YmcCompleter GoTo<CR>
