
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
"---------------------------------------------------------------
" Plugins
"---------------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Style
Plug 'machakann/vim-highlightedyank'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
" Themes
Plug 'altercation/solarized'
Plug 'dracula/vim'
Plug 'liuchengxu/space-vim-dark'
" Navigation
Plug 'preservim/nerdtree'
Plug 'tpope/vim-unimpaired'
" Editing
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
" Coding
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'sophacles/vim-processing'
Plug 'vim-syntastic/syntastic'
Plug 'ycm-core/YouCompleteMe'
" Status bar
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"---------------------------------------------------------------
" Basic Settings
"---------------------------------------------------------------
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
 
" Enable syntax highlighting
syntax on
" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" More natural split opening
set splitbelow
set splitright

" Some sensible.vim settings
set backspace=indent,eol,start
set complete-=i
set laststatus=2
set ruler
set wildmenu
set autoindent
set tabstop=8 softtabstop=8 expandtab shiftwidth=8 smarttab

" Highlight instead of underlining current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Cursor style per mode
let &t_EI = "\e[1 q" " normal
let &t_SI = "\e[5 q" " insert
let &t_SR = "\e[4 q" " replace 

" Set line numbers and relative line numbers
set nu rnu
 
" Always show five lines above/below cursor
set scrolloff=5

" Start searching before pressing enter
set incsearch

" Makes visible whitespace prettier
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Set colorscheme
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

"------------------------------------------------------------
" Mappings
"------------------------------------------------------------
" Reset leader
let mapleader = ","

" Easy macro
nnoremap Q @q

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" 'U' is redo
nmap U <C-r>

" Easier window (split) navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ergonomic escape
inoremap jk <Esc>
inoremap JK <Esc>

" Fast saving
nmap <leader>w :w!<cr>

" Ergonomic command mode
nnoremap ; :

" n always searches forward and N always searches backwards
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Move normally between wrapped lines
nmap j gj
nmap k gk
"------------------------------------------------------------
" Plugin Settings
"------------------------------------------------------------
" * NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
nmap <leader>t :NERDTreeToggle<CR>


" * Vim-Airline
" Show buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

" * Vim-AirlineThemes
let g:airline_theme='dracula'
" Powerline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" * Vim-HighlightedYank
map y <Plug>(highlightedyank)
let g:highlightedyank_highlight_duration = 200

" * Vim-Indent-Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1

" * UltiSnips
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

