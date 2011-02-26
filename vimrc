" pathogen plugin bekapcsolasa -> pluguneket mappankent lehet kezelni
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set number
set mouse=a
set sw=2
set directory=~/.vimbackup
set ignorecase
set smartcase
set wrap
set linebreak
set showbreak=…

map <Down> gj
map <Up> gk

map <c-c> <c-a>
map <c-l> <c-w>l<c-w>50>
map <c-h> <c-w>h<c-w>50>
map <c-j> <c-w>j<c-w>20+
map <c-k> <c-w>k<c-w>20+
nnoremap <Leader>vs <c-w>25>
nnoremap <Leader>hs <c-w>10+

" kodblokk osszecsukasa
map <c-b> zf%
map <BS> zfa{

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

"autocmd FileType python call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType javascript call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType html call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType css call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType xml call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType php call SuperTabSetDefaultCompletionType("<c-x><c-o>")
"autocmd FileType c call SuperTabSetDefaultCompletionType("<c-x><c-o>")

filetype plugin on

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

