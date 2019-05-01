""" VIM PLUG
call plug#begin('~/.vim/autoload')
""" Plug 'itchyny/lightline.vim'        " Status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'         " Theme
Plug 'scrooloose/nerdtree'          " File tree explorer, toggle with <C-o>
Plug 'scrooloose/nerdcommenter'     " Comment functions
Plug 'Xuyuanp/nerdtree-git-plugin'  " Not actually sure if this one works
Plug 'tpope/vim-surround'           " Useful surround plugin for brackets
Plug 'tpope/vim-fugitive'           " Used for a status on the status bar
call plug#end()
""" End VIM PLUG


""" Allows onedark to operate correctly
if (empty($TMUX))
    if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif

    if (has("termguicolors"))
        set termguicolors
    endif
endif


""" Settings for lightline bar
"let g:lightline = {
      "\ 'colorscheme': 'onedark',
      "\ 'active': {
      "\   'left': [ [ 'mode', 'paste' ],
      "\             [ 'gitbranch', 'readonly', 'filename' ]     ]
      "\ },
      "\ 'component_function': {
      "\   'gitbranch': 'fugitive#head'
      "\ },
      "\ }


""" Airline settings
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


""" Settings for onedark and lightline
syntax on
colorscheme onedark
set laststatus=2
set noshowmode


""" Settings for line numbers
set number


""" Bell off
set belloff=all


""" NERDTree settings
let g:NERDTreeWinSize=23
""" Closes vim automatically if there is only NERDTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



""" Sets tab settings to use tabs of length 4
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4


""" Set search options
set hlsearch
set incsearch
hi Search ctermbg=Blue ctermfg=White
hi Search guibg=Blue guifg=White


""" KEY MAPPINGS
let mapleader='-'
inoremap jk <esc>
nnoremap <C-n> <esc>$a<cr>
nnoremap <C-o> :NERDTreeToggle<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:wq<cr>
noremap <C-l> :set relativenumber!<Cr>
nnoremap <Space> :nohlsearch<Bar>:echo<Cr>
nnoremap <C-w> :AirlineToggleWhitespace<cr>
