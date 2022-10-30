call plug#begin('~/.vim/plugged')

	Plug 'dracula/vim', {'as': 'dracula'}
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/syntastic'

call plug#end()

set number
set relativenumber
set linebreak
set textwidth=85
set hlsearch
set smartcase
set ignorecase
set smartindent
set ruler
set cursorline
""set cursorcolumn
set shiftwidth=4
set tabstop=4
set nobackup
set showmode
set showmatch
set wildmenu
set noshowmode
set laststatus=2

syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme dracula

let g:lightline = {'colorscheme': 'dracula'}
