
" General {{{
set nocompatible

set history=1000                   

let mapleader=","
let g:mapleader = ","

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" Save using sudo
noremap <leader>w :w !sudo tee % > /dev/null<cr>
"}}}



" Plugins {{{
" Automatic installation, see https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'scrooloose/syntastic'
Plug 'jgdavey/tslime.vim'
Plug 'ervandew/supertab'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/neocomplete.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/gitignore'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'simnalamburt/vim-mundo'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/Align'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
Plug 'michaeljsmith/vim-indent-object'
Plug 'edsono/vim-matchit'
Plug 'chrisbra/NrrwRgn'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Konfekt/FastFold'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'dag/vim2hs', { 'for' : 'haskell' }

" Color schemes
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
"}}}



" VIM user interface {{{
" Set 5 lines to the cursor - when moving vertically using j/k
set scrolloff=5

" Use Wildmenu
set wildmenu

" Tab-complete files up to longest unambiguous prefix
set wildmode=list:longest,full

" Ignores in wildmenu
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git

" Allow the cursor to move just past the end of the line
set virtualedit=onemore            

" A buffer becomes hidden when it is abandoned
set hidden                         

"Always show current position
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Commands which wrap the cursor around the line border
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch
"
" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Show partial commands
set showcmd

" If in Insert, Replace or Visual mode put a message on the last line
set showmode

" Highlight line with cursor
set cursorline

" Indicate fast terminal connection
set ttyfast

"A lways show the status line
set laststatus=2

" No mouse
set mouse=

" Show line numbers
set number

" No sounds
set noerrorbells visualbell t_vb=

" Strings to use in list mode
set listchars=eol:¬,tab:▸\

" Always show the status line
set laststatus=2

set cmdheight=1
"}}}



" Folding {{{
" Lines with equal indent form a fold
set foldmethod=indent

" 10 folds nested max
set foldnestmax=10

" Start with all folds open
set foldlevelstart=99

" Add a bit extra margin to the left
set foldcolumn=1

" automatically fold vimrc itself by categories
augroup vimrcFold
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup END
"}}}



" Colors and Fonts {{{
" Enable Syntax Highlighting
syntax on 

" Use utf8 encoding
set encoding=utf-8

set t_Co=256

set background=dark

colorscheme hybrid

" Different background color past 80 columns
highlight ColorColumn ctermbg=235 guibg=#2c2d27
execute "set colorcolumn=" . join(range(81,335), ',')

" Clear the highlighting of CursorLine and Conceal
hi clear CursorLine
hi clear Conceal

" Set color of number column on cursorline
highlight CursorLineNR ctermbg=None ctermfg=245

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use powerline fonts for airline
let g:airline_powerline_fonts = 1

let g:airline_theme='laederon'
"}}}



" Files, backups and undo {{{
" Turn off backups
set nobackup
set nowritebackup
set noswapfile

" Persistent Undo
set undodir=~/.vimundo
set undofile
set undolevels=1000
set undoreload=10000

" http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" Remember info about open buffers on close
set viminfo='50,\"100,:100,n~/.vim/.viminfo

" Fix path issues from vim.wikia.com/wiki/Set_working_directory_to_the_current_file
let s:default_path = escape(&path, '\ ') " store default value of 'path'

" Always add the current file's directory to the path and tags list if not
" already there. Add it to the beginning to speed up searches.
autocmd BufRead *
      \ let s:tempPath=escape(escape(expand("%:p:h"), ' '), '\ ') |
      \ exec "set path-=".s:tempPath |
      \ exec "set path-=".s:default_path |
      \ exec "set path^=".s:tempPath |
      \ exec "set path^=".s:default_path

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END
"}}}



" Text, tab and indent related {{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Use 2 spaces for tab
set tabstop=2
set shiftwidth=2

" Indentation
set autoindent
set smartindent

" Don't wrap lines
set nowrap
"}}}



" Visual mode related {{{
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>
"}}}



" Moving around, tabs, windows and buffers {{{
" move rowwise, not linewise
nmap j gj
nmap k gk

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Mappings to access buffers 
map <right> :bn<cr>
map <left> :bp<cr>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Close the current buffer
map <leader>bd :bd<CR>
map <leader>Bd :Bdelete<CR>

" " Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Opens a new file with the current buffer's path
map <leader>e :edit <c-r>=expand("%:p:h")<cr>/
"}}}



" Editing, copying and pasting {{{
" Leave cursor at the point where it was before editing (VimTip1142)
nmap . .`[

" Copy text to end-of-line
nnoremap Y y$

" Copy an entire line and paste it before the current line
" Use a count to specify the line number (default is line 1). 
" For example, 12_ would copy line 12 to before the current line. 
nnoremap _ ggY``P

" Yank, delete and paste from/to clipboard
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>d "+d
vmap <leader>d "+d
nmap <leader>p "+p
vmap <leader>p "+p
"}}}


" Helper functions {{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Delete trailing white space on save
function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
"}}}



" Plugin Settings {{{

" == Syntastic ==
map <leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


" == CtrlP == 
nnoremap <silent> <Leader><space> :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/]\.(git|hg|svn)$' }


" == Supertab ==
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif


" == vim-tmux-navigator ==
" Manually create key mappings (to avoid rebinding C-\)
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" == Mundo ==
nmap <silent> <leader>u :MundoToggle<CR>


" == NERDTree ==
" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>N <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>n <ESC>:NERDTreeToggle<CR>


" == Ack ==
map <leader>a :Ack 


" == NarrowRegion ==
map <leader>z :NarrowRegion<CR>


" == Tagbar ==
map <leader>tt :TagbarToggle<CR>


" == Slime ==
let g:slime_target = "tmux"
vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
nmap <silent> <Leader>rv <Plug>SetTmuxVars


" == Align ==
" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
vmap a= :Align =<CR>
vmap a, :Align ,<CR>
vmap a- :Align -><CR>
vmap a<bar> :Align <bar><CR>
" Prompt for align character
vmap ap :Align


" == Extradite ==
let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep 
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list)
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>


" == NeoComplete ==
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
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
map <leader>c :NeoCompleteToggle<CR>
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
"}}}

