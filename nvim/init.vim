" Options
set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu

" Tabs size
set expandtab
set shiftwidth=4
set tabstop=4

" Syntax
filetype plugin indent on
syntax on

" Color Support
set t_Co=256
let term_program=$TERM_PROGRAM

if term_program !=? 'Apple_Terminal'
	set termguicolors
else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif

" Support for true italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" File browser
" let g:netrw_banner=0
" let g:netrw_liststyle=0
" let g:netrw_browse_split=4
" let g:netrw_altv=1
" let g:netrw_winsize=25
" let g:netrw_keepdir=0
" let g:netrw_localcopydircmd='cp -r'

" Create file without opening buffer
 function! CreateInPreview()
	let l:filename = input('Please enter filename: ')
	execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
	redraw!
endfunction

function! Netrw_mappings()
	noremap <buffer>% :call CreateInPreview()<cr>
endfunction

augroup auto_commands
    autocmd filetype netrw call Netrw_mappings()
augroup END

call plug#begin()
    " Appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'dracula/vim',{'as':'dracula'}

    " Utilities
    Plug 'sheerun/vim-polyglot'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'preservim/nerdtree'

    " Completion / linters / formatters
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install'}
    Plug 'plasticboy/vim-markdown'

    " Git
    Plug 'airblade/vim-gitgutter'

call plug#end()

colorscheme dracula
