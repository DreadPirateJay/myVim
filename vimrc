"******************************************************************************
" General
"******************************************************************************
" Use Vim settings, rather than Vi settings
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen for plugin management
call pathogen#infect()
call pathogen#helptags()

" Enable file type detection and do language-dpendent indenting
filetype plugin indent on

" Set to autoread when a file is changed from the outside
set autoread

" Fast saving
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>
imap :w<CR> <Esc>:w<CR>
nmap :W<CR> :w<CR>

" Use jj to exit insert mode
imap jj <Esc>


"******************************************************************************
" User Interface
"******************************************************************************
" Vertical & horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set wildmenu " Turn on the wildmenu

set hid " Change buffers without saving

" Make the backspace key behave sanely
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching
set smartcase

set hlsearch " Highlight search terms

set incsearch " Make search behave like modern search functions

set showmatch "Show matching brackets when cursor is over them
set mat=2 " How many tenths of a second to blink

set ruler " Always show the current position
set number " Show the line numbers

" Set visual indicators for tab, trailing spaces, and when a line extends off
" the screen. Toggle this with <Leader>l
set listchars=tab:\|\ ,trail:~,extends:>,precedes:<
nmap <silent> <Leader>l :set list!<CR>

" Set the default window size for the GUI
if has("gui_running")
  set lines=999
  set columns=999
endif

"******************************************************************************
" Colors and Fonts
"******************************************************************************
" Switch syntax highlighting on
syntax on

" Set colorscheme for gui and console versions
if has("gui_running")
  colorscheme railscasts
else
  colorscheme slate
endif

" Set font according to system
if has("win32")
  set gfn=Lucida\ Console:h10
elseif has("unix")
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

set encoding=utf8

"******************************************************************************
" Files, backups and undo
"******************************************************************************
" Turn off backup and swap
set nobackup
set nowb
set noswapfile

"******************************************************************************
" Test, tab and indent
"******************************************************************************
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set autoindent
set smartindent
set wrap

"******************************************************************************
" Test, tab and indent
"******************************************************************************
" remap ctrl keys to move between windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" close the current buffer
map <Leader>bd :Sbd<CR>

" Use the arrow keys to switch between buffers
map <right> :bn<CR>
map <left> :bp<CR>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" When pressing <Leader>cd switch to the current buffer's directory
map <Leader>cd :cd %:p:h<CR>

"******************************************************************************
" Parenthesis/bracket expanding
"******************************************************************************
"vnoremap $1 <esc>`>a)<esc>`<i(<esc>
"vnoremap $2 <esc>`>a]<esc>`<i[<esc>
"vnoremap $3 <esc>`>a}<esc>`<i{<esc>
"vnoremap $$ <esc>`>a"<esc>`<i"<esc>
"vnoremap $q <esc>`>a'<esc>`<i'<esc>
"vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap ( ()<esc>i
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap (<CR> (<esc>o)<esc>O
inoremap [ []<esc>i
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap { {}<esc>i
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap {<CR> {<esc>o}<esc>O
"inoremap ' ''<esc>i
"inoremap <expr> '  strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "'"
"inoremap " ""<esc>i

"******************************************************************************
" Options for minibufexpl
"******************************************************************************
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

" map F4 to the Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" map <Leader>p to NERDTree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
