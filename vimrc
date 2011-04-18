" pathogen plugin bekapcsolasa -> pluguneket mappankent lehet kezelni
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set number
set mouse=a
set sw=2
set directory=~/.vimbackup//
set wrap
set linebreak
set showbreak=…
call togglebg#map("<Leader>tb")

" statusline
set statusline=%F%m%r%h%w\ %Y\ %l\/%v\ %p%%\ %Ll
set laststatus=2

" navigation
noremap <Down> gj
noremap <Up> gk
set so=7

map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k

nnoremap <Leader>tn :tabnew.<CR>

" search
set ignorecase
set smartcase
set hlsearch
nnoremap <Leader>s :nohlsearch<CR>
set incsearch

" szamok incrementalasa byobu alatt is (c-a atirhatatlan byobu parancs)
map <c-c> <c-a>

" kodblokk osszecsukasa
nnoremap <c-f> zf%
nnoremap <BS> zfa{

" sorvegi szokozok automatikus kiemelese
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" sorvegi szokozok kiemelesenek ki/bekapcsolasa
nnoremap <Leader>wn :match ExtraWhitespace /\s\+$/<CR>
nnoremap <Leader>wf :match<CR>

" sorvegi szokozok automatikus torlese
autocmd BufWritePre * :%s/\s\+$//e

" kijelolt szoveg csereje
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

autocmd FileType css call SuperTabSetDefaultCompletionType("<c-x><c-o>")

filetype plugin on

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" vim-autoclose bugfix for xterm
if !has("gui_running")
  let g:AutoClosePreservDotReg = 0
endif

