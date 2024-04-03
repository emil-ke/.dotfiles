set nocompatible
syntax on
filetype plugin indent on

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

Plug('https://github.com/junegunn/seoul256.vim.git')

Plug('ghifarit53/tokyonight-vim')

Plug('junegunn/goyo.vim')

Plug('junegunn/limelight.vim')

Plug('preservim/vim-markdown')
call plug#end()

set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

function! s:goyo_enter()
  Limelight
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  Limelight!
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

nnoremap gy :Goyo<CR>

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
