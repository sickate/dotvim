" vim-plug {{{
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'tomasr/molokai' | Plug 'ciaranm/inkpot' | Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

Plug 'powerline/powerline'

"Plug 'wincent/Command-T'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'milkypostman/vim-togglelist'

Plug 'nathanaelkane/vim-indent-guides'

" Languages
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'motus/pig.vim'

" Commenter
Plug 'sickate/nerdcommenter'

" All language Lint engine, need to install tools per language
Plug 'w0rp/ale'
" Syntax checking
" Plug 'vim-syntastic/syntastic'

Plug 'junegunn/vim-github-dashboard'

" jedi only in python, uncomment later if need it
" Plug 'davidhalter/jedi-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ervandew/supertab'

" ultisnips requires python, vim-snippets uses VimL
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Diff in status column
Plug 'mhinz/vim-signify'

" Show current function name in status
Plug 'tyru/current-func-info.vim'

"Sidebar to show current code structure
Plug 'majutsushi/tagbar'

"text alignment
Plug 'godlygeek/tabular'

" Insert mode auto-complete for quotes parens brackets, etc.
Plug 'Raimondi/delimitMate'

" search
Plug 'mileszs/ack.vim'

" open file and line
Plug 'bogado/file-line'


" Look into them later
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/vitality.vim' " iterm2 focus get/lost event listener
" comment stuff out
" Plug 'tpope/vim-commentary'
" united interfaces
" Plug 'Shougo/denite.nvim'
" tab switching
" kien/tabman.vim

" Initialize plugin system
call plug#end()
"}}}


" current function
" let &statusline .= ' [%{cfi#format("%s", "")}]'

"set ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" General {{{
let mapleader = ","

set autoread
set autowrite
au FocusLost * :wa

set title

set pastetoggle=<F2>

set wildmenu
set wildmode=list:longest
set wildignore+=*coverage*,*.pyc,*.o,*.obj,.git,*.beam,ebin/*,*.gem,*.class,*.lo
set wildignore+=*.log,*.a

set tags=./tags,tags,~/tags

set backspace=indent,eol,start

set hidden

set directory=~/.vim/vimswp
set nobackup
set nowritebackup
set backupdir=~/.vim/vimbak
set undofile
set undodir=~/.vim/vimundo

if has("balloon_eval")
    set ballooneval
endif

set foldenable
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd BufNewFile,BufEnter * set formatoptions-=ro

command! W exec 'w !sudo tee % > /dev/null' | e!

set splitright
set splitbelow
"}}}

" NERDTree {{{
let g:NERDTreeDirArrows=1
let g:NERDTreeChDirMode=2
let g:NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
nnoremap <leader>n :NERDTreeToggle<CR>
"}}}

" GUI {{{
set guioptions=egmrt
set gfn=Monaco\ for\ Powerline:h12
"}}}

" File format {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,default,gbk,latin1

set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

set autoindent
set cindent
set smartindent

set wrap
set textwidth=0
"}}}

" Visibile {{{
set number
"set cursorline
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline

set colorcolumn=+1,+41
autocmd FileType markdown setlocal colorcolumn=0

set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮

set scrolloff=3
set laststatus=2
"}}}

" Mouse {{{
set mouse=nv
set mousehide
set ttymouse=xterm2
set ttyfast
"}}}

" Search {{{
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap / /\v
vnoremap / /\v

nnoremap <leader><space> :noh<cr>
"}}}

" Mapping {{{
inoremap jj <ESC>
cnoremap jj <C-c>

inoremap <F1> <NOP>
nnoremap <F1> <NOP>
vnoremap <F1> <NOP>

nnoremap <UP> g<UP>
nnoremap <DOWN> g<DOWN>
"nnoremap <LEFT> g<LEFT>
"nnoremap <RIGHT> g<RIGHT>

inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>

nnoremap ; :
nnoremap ;; :!

" Conflict with
"nnoremap <tab> %
"vnoremap <tab> %

nnoremap <leader>ws :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>v V`]

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> + <C-w>>
nnoremap <silent> _ <C-w><
nnoremap <silent> <C-=> <C-w>+
nnoremap <silent> <C--> <C-w>-
nnoremap <silent> <Leader>w= :wincmd =<CR>

nnoremap <S-h> gT
nnoremap <S-l> gt
nnoremap <C-t> :tabnew<CR>

nnoremap <leader>w :w<CR>

inoremap <C-a> <C-O><S-i>
inoremap <C-e> <End>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-h> <BACKSPACE>
inoremap <C-d> <DELETE>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>
cnoremap <C-b> <LEFT>
cnoremap <C-f> <RIGHT>
cnoremap <C-h> <BACKSPACE>
cnoremap <C-d> <DELETE>

vnoremap < <gv
vnoremap > >gv

nnoremap <C-]> g<C-]>

nnoremap <Leader>fn :cn<CR>
nnoremap <Leader>fp :cp<CR>
"}}}

" Colorscheme {{{1
set background=dark

" Solarized {{{2
"let g:solarized_termcolors=256
"colorscheme solarized
"}}}2

if has('gui_running')
    " Molokai {{{2
    colorscheme molokai
    "}}}2
else
    " Inkpot {{{2
    let g:inkpot_black_background = 0
    colorscheme inkpot
    "}}}2
endif

"}}}1

" Powerline {{{
set rtp+=~/.vim/powerline/powerline/bindings/vim
"}}}

" Ack {{{
nnoremap <leader>a :Ack<space>
let g:ackprg='ag --column'
"}}}

" Fugitive {{{
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gu :Git pull<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gx :wincmd h<CR>:q<CR>
nnoremap <leader>gb :Gblame<CR>
"}}}

" Togglelist {{{
nnoremap <script> <silent> <leader>fw :call ToggleQuickfixList()<CR>
nnoremap <script> <silent> <leader>fl :call ToggleLocationList()<CR>
nnoremap <leader>t :TagbarToggle<CR>
"}}}

