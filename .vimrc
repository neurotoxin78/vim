set nocompatible              " be iMproved
filetype off                  " required!

" Start in insert mode and
" set escape to switch to
" command mode or back to
" insert.
set im!
map <Esc> :set im!<CR><c-o>:echo <CR>
map i :set im!<CR><c-o>:echo <CR>
map! <Esc> <c-o>:set im!<CR>:echo <CR>
map a :set im<CR><c-o>l<c-o>:echo <CR>
map A :set im<CR><c-o>$<c-o>:echo <CR>
map o :set im<CR><c-o>$<c-o>:echo <CR><CR>
map O :set im<CR><c-o>^<c-o>:echo <CR><CR><c-o>

imap <c-Right> <Esc>:bn<CR><Esc>
imap <c-Left> <Esc>:bp<CR><Esc>

map <C-c> "+y<CR> 
map <C-v> "+p<CR> 

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
nmap <F2> :update<CR>
vmap <F2> <Esc><F2>gv
imap <F2> <c-o><F2>

map <silent> <f10> :wq<cr>
imap <silent> <f12> <esc>:q!<cr>


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Work with code
Bundle 'SirVer/ultisnips'
Bundle 'tomtom/tcomment_vim'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'

" Git
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'


" Python
Bundle 'davidhalter/jedi-vim'

" Golang
Bundle 'Blackrush/vim-gocode'

" JavaScript
Bundle 'marijnh/tern_for_vim'

" Utils
Bundle 'aliev/bclose'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Yggdroot/indentLine'
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'jmcantrell/vim-virtualenv'

" Color scheme pack
Bundle 'flazz/vim-colorschemes'

filetype plugin indent on     " required!

if has("gui_running")
    syntax on           " syntax-highlighting
    set background=light " Backgroud
"    colors DomClear " Color scheme
    colors solarized
    "set guioptions=g " Disable all GUI elements
    "set guioptions+=c " Enable Console-based dialogs for simple queries
    "set hlsearch        " Highlight search terms (very useful!)
    set incsearch       " Show search matches while typing
    set guifont=Ubuntu\ Mono\ 14
"    set guifont=Liberation\ Mono\ 14

    execute "set colorcolumn=" . join(range(81,335), ',')

    let g:airline_theme = 'solarized'

"    if has('mac')
"        set guifont=Meslo\ LG \S \ for\ Powerline 14
"    else
"        set guifont=Meslo\ LG \S \ for\ Powerline 14
"    endif
else
    syntax on
    set t_Co=256
endif

if has('multi_byte')
    set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
endif

set fillchars=stl:\ ,stlnc:\ ,vert:│

if has("linebreak")
      let &sbr = nr2char(8618).' ' " Show ↪ at the beginning of wrapped lines
endif

set confirm " get a dialog when :q, :w, or :wq fails

let mapleader = "," " map leader

let maplocalleader = "_" " local leader

set lazyredraw " Don't redraw while executing macros (good performance config)

set laststatus=2 " enable statusline

set magic " For regular expressions turn magic on

set ignorecase " Searches are Non Case-sensitive

set cursorline " Highlight current cursor position

set cursorcolumn " Highlight cursor column

set smartcase " Do smart case matching when searching

set showmatch " Show matching brackets when text indicator is over them

set showcmd " Show incomplete cmds down the bottom

set showmode " Show current mode down the bottom

set title " show title

set acd " Vim will change the current working directory whenever you open a file

set expandtab " use space instead of tab

set autoread " Reload files changed outside automatically

set tabstop=4 " 1 tab == 4 spaces

set shiftwidth=4

set smarttab " Be smart when using tabs

set autoindent " Enable auto indent

set smartindent " Smart indent

set wrap " enable word wrap

" set nowrap " disable word wrap

set noerrorbells visualbell t_vb= " No annoying sound on errors

set encoding=utf8 " Default encoding

set termencoding=utf-8 " terminal encoding

set fileencodings=utf8,cp1251 " supported file encodings

set number " enable line numbers

set ruler " always display cursor position

if has('mouse')
    set mouse=a " Mouse support
    set mousemodel=popup
    set mousehide " Hide cursor when typing
endif

set hidden " A buffer becomes hidden when it is abandoned

set nobackup " Disable backup files

set noswapfile " Disable swap files

set noautochdir " change the current working directory whenever you open a file

set wildmenu " Turn on the Wild menu

set wildmode=list:longest,list:full " Wildmenu configuration

set wildignore+=*.o,*.pyc,*.jpg,*.png,*.gif,*.db,*.obj,.git " Ignore compiled files

set clipboard+=unnamed " Global clipboard between the system and the editor

set ttyfast " Optimize for fast terminal connections

set path=.,,**

let g:jedi#show_call_signatures = 0 " Disable or enable function call signature
let g:jedi#popup_on_dot = 0 " Disable autocomplete when i type dot
let g:jedi#use_tabs_not_buffers = 0

if has("autocmd")
    " Enable jedi completion for omnifunc
    autocmd FileType python set omnifunc=jedi#completions

    " Disable jedi-vim documentation
    autocmd FileType python setlocal completeopt-=preview

    " Enable autocompletion for Golang
    autocmd FileType go set omnifunc=gocomplete#Complete

    " Disable gocode documentation
    autocmd FileType go setlocal completeopt-=preview
    autocmd FileType javascript setlocal completeopt-=preview

    " Indentation
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=8

    " JavaScript goto definiction
    autocmd FileType javascript nnoremap <leader>g :TernDef<CR>

    " Enable autocompletion for Golang
    autocmd FileType go set omnifunc=gocomplete#Complete

    " Disable gocode documentation
    autocmd FileType go setlocal completeopt-=preview
endif

" Syntax check mode for python (pip install pylama)
let g:syntastic_python_checkers = ['pylama']

" Syntax check mode for javascript (npm install jslint)
let g:syntastic_javascript_checkers = ['jslint']

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1

" Syntastic signs (disables by default)
let g:syntastic_enable_signs=0

vmap <F2> "+y 

" Comment selected line
map <leader>/ :TComment<CR>

" File autocomplte
imap <leader>f <c-x><c-f>

" Default autocomplete
imap <leader>c <c-x><c-o>

" Show/hide trail characters
nmap <leader>l :set list!<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" Close buffer with ask save it
nnoremap <leader>w :confirm :Bclose<CR>

" T-Comment keymap
let g:tcommentMapLeader2 = '<leader>/'

let g:airline_powerline_fonts = 1 " Use airline fonts

" If you want to auto-completion to work stable in older vim, disable this option
let g:airline#extensions#tabline#enabled = 1

" Airline tabs settings
let g:airline#extensions#tabline#fnamemod = ':t'

let g:UltiSnipsJumpForwardTrigger='<tab>'

let g:NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']

nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

let g:indentLine_faster=1
let g:indentLine_char = nr2char(6145)

" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=dark
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1

