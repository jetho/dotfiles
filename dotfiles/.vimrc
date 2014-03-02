" This is vim, not vi
set nocompatible

" Vundle
source ~/.vim/vundlerc

if &t_Co > 2 || has("gui_running")
" Syntax highlighting
    syntax enable
    colorscheme Tomorrow-Night-Eighties
endif

"set up man plugin
source /usr/share/vim/vim74/ftplugin/man.vim

"viminfo
set viminfo='50,\"100,:100,n~/.vim/.viminfo
set history=1000

set undofile
set undodir=~/.vimundo
set nobackup
set nowritebackup
set noswapfile

set ttyfast
set lazyredraw

set scrolloff=3

set hidden

set swb=useopen,usetab

" Delete ALL the things!
set backspace=indent,eol,start

" show statusline at all times
set laststatus=2

" show right margin at 80
" set cc=80

" Enable line-numbers by default
set number

" Don't break words when breaking lines
set linebreak

" Force utf8 encoding
set enc=utf-8

" Enable Powerline fonts for Airline
let g:airline_powerline_fonts = 1

" Set tabstop to 4 by default
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Enable autoindent
set autoindent
set smartindent

" Show unfinished commands
set showcmd

" Show pattern match halfway
set incsearch
set hlsearch
set ignorecase
set smartcase

" Leave curser at the point where it was before editing (VimTip1142)
nmap . .`[

" Turn off terminal bell
set noerrorbells visualbell t_vb=

" enable showbreak and show the character in between lines
let &showbreak = '+++ '
set cpoptions+=n

" show full tag (together with ctags)
set sft

" rodent, begone!
set mouse=

" setting listchars
set listchars=eol:¬,tab:▸\

set wildmenu
set wildmode=list:longest
set wildignore+=*.class,*.o,*.hi
set wildignore+=*/.git/*,*/.hg/*

let g:haskell_conceal = 0

" autocmd settings
if has('autocmd')
" terminal bell (again, for gui)
    autocmd GUIEnter * set visualbell t_vb=

" Enable file type detection.
    filetype plugin indent on

" mail-specific settings
    autocmd FileType mail set noautoindent
    autocmd FileType mail 9
endif

" keybinds
let mapleader=","

" Split windows with vv or ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" move rowwise, not linewise
nmap j gj
nmap k gk

" Plugin Shortcuts
map <leader>d :NERDTreeToggle<CR>
map <leader>u :GundoToggle<CR>
map <leader>p :CtrlP<CR>
map <leader>h :HLint<CR>
map <leader>c :NeoCompleteToggle<CR>
map <leader>a :Ack 
map <leader>b :BufExplorer<CR>
map <leader>z :NarrowRegion<CR>

" We don't want that kind here
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Buffers
map <leader>n :new<cr>
map <leader>bd :bdelete!<cr>
map <leader>ba :1,1000 bd!<cr>

" Save using sudo
noremap <Leader>W :w !sudo tee % > /dev/null

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Yank text to clipboad 
noremap <leader>y "*y
noremap <leader>yy "*Y

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" EasyMotion
let g:EasyMotion_leader_key = '<Space>'

" Haskell shortcuts
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" use :make to check the current haskell file for errors 
:let &makeprg='hdevtools check %'

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Syntastic
" Toggle between passive and active type checking
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
" Always show error list when editing
let g:syntastic_auto_loc_list=1

" Vim-slime: use CTRL-C CTRL-C to send the current visual
" selection to the  tmux session (running ghci).
" socket_name: default 
" target_pane: session:window.pane for example "jens:1.2"
" (Show pane numbers in tmux by using CTRL-A Q)
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
