""" VIM PLUG
call plug#begin('~/.vim/autoload')
Plug 'tpope/vim-fugitive'           " Used for a status on the status bar
Plug 'itchyny/lightline.vim'        " Status bar plugin
Plug 'joshdick/onedark.vim'         " Theme
Plug 'scrooloose/nerdtree'          " File tree explorer, toggle with <C-n> 
Plug 'Xuyuanp/nerdtree-git-plugin'  " Not actually sure if this one works
Plug 'tpope/vim-surround'           " Useful surround plugin for brackets
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


let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ]     ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }



""" Settings for onedark and lightline
syntax on
colorscheme onedark
set laststatus=2
set noshowmode


""" Settings for line numbers
set number
noremap <C-l> :set relativenumber!<Cr>


""" Auto-Open NERDTree on start if no file is specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""" Closes vim automatically if there is only NERDTree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" NERDTree width
let g:NERDTreeWinSize=23


""" Sets tab settings to use tabs of length 4
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4


""" Set search options
set hlsearch   """ Sets search highlighting on
""" Maps space bar to remove highlights after a search
nnoremap <Space> :nohlsearch<Bar>:echo<Cr>
""" Changes the color of seach highlights
hi Search ctermbg=Blue ctermfg=White
hi Search guibg=Blue guibg=White


""" KEY MAPPINGS
let mapleader="-"
noremap <C-n> :NERDTreeToggle<CR>
inoremap jk <esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:wq<cr>
