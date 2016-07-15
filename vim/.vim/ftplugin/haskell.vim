" General {{{
set completeopt+=longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox,.stack-work

augroup whitespace
  autocmd!
  autocmd BufWrite *.hs :call DeleteTrailingWS()
augroup END
"}}}


" CtrlP {{{
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.hg|.svn|.cabal-sandbox|.stack-work)$' }
"}}}


" tabular {{{
let g:haskell_tabular = 1
"}}}


" neco-ghc {{{
let g:haskellmode_completion_ghc = 1
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
"}}}


" GhcMod {{{
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
nmap <silent> <leader>hs :GhcModSplitFunCase<CR>
nmap <silent> <leader>he :GhcModTypeClear<CR>
"}}}


" vim2hs {{{
let g:haskell_conceal = 0
"}}}


" Tagbar {{{
set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update --force<CR>:call system("git-hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>


set csprg=hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction

au BufEnter /*.hs call LoadHscope()
au FileType haskell nested :TagbarOpen
"}}}


" Haskell Lint {{{
let g:hlintRefactor#disableDefaultKeybindings = 1

map <silent> <leader>hr :call ApplyOneSuggestion()<CR>
map <silent> <leader>hR :call ApplyAllSuggestions()<CR>
nmap <silent> <leader>hl :HLint<CR>
"}}}


" Hoogle {{{
" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>
" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 
" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>
" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 
" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>
" }}}


" Conversion {{{
function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>
" }}}

