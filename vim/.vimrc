set nocompatible
syntax on
filetype plugin indent on

let mapleader = ','

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

set hlsearch
set ignorecase
set incsearch
set smartcase

set display+=lastline
set encoding=utf-8
set linebreak
set scrolloff=1
set sidescrolloff=5
set wrap

set ruler
set wildmenu
set number
set noerrorbells
set visualbell
set mouse=a
set background=dark

set foldmethod=indent
set foldnestmax=3
set nofoldenable

set spell

set laststatus=0

set fillchars=eob:\ 

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set foldcolumn=0


call plug#begin()
" Plug('https://github.com/junegunn/seoul256.vim.git')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug('junegunn/fzf.vim')
Plug('bluz71/vim-moonfly-colors')
" Plug('preservim/vim-markdown')

Plug('junegunn/goyo.vim')
Plug('junegunn/limelight.vim')

Plug('preservim/nerdtree')

call plug#end()

set termguicolors

colorscheme moonfly


let g:limelight_active = 0

function! s:goyo_enter()
  " Limelight
  " let g:limelight_active = 1
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " quit Vim if this is the only remaining buffer
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! ToggleLimeLight()
    if g:limelight_active
        Limelight!
        let g:limelight_active = 0
    else
        Limelight
        let g:limelight_active = 1
    endif
endfunction

nnoremap ll :call ToggleLimeLight()<CR>

nnoremap gy :Goyo<CR>
nnoremap qq :noh<CR>

" copy to system clipboard instead
vnoremap y "+y

" normal- and visual mode post from system clipboard
nnoremap p "+p
vnoremap p "+p

" fzf stuff
let g:fzf_layout = { 'down': '~35%' }

" use case-insensitive search unless uppercase letters are used
let g:fzf_default_command = 'rg --files --hidden --follow --glob "!.git/*"'
let g:fzf_colors = { 'fg': ['fg', 'Normal'], 'bg': ['bg', 'Normal'], 'hl': ['fg', 'Comment'] }

" use ripgrep (faster)
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" set default options for all fzf commands
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

nnoremap <leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>c :Commits<CR>

nnoremap <leader>e :NERDTreeToggle<CR>
" exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" move between windows using Ctrl + h/j/k/l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

nnoremap <leader>t :belowright terminal<CR>
