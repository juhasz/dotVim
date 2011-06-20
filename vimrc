" pathogen plugin
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set modelines=0

filetype plugin on

" color settings (solarized)
let solarized_diffmode="high"
set background=dark
colorscheme solarized
call togglebg#map("<Leader>tb")

" appereance
syntax on
set relativenumber
set cursorline
set cursorcolumn
set wrap
set linebreak
set showbreak=…
set grepprg=grep\ -nH\ $*
set scrolloff=7
set list
set listchars=tab:\ \ ,trail:·


set autoindent
set smartindent
set expandtab
set softtabstop=2
set tabstop=2
set mouse=a
set shiftwidth=2
set directory=~/.vim/backupdir//
set undodir=~/.vim/undodir//
set undofile
set pastetoggle=<Leader>tp

" statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set showcmd

" navigation
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" lazy commands
nnoremap ; :
vnoremap ; :
inoremap ;; <Esc>:
inoremap jj <Esc>
inoremap <Leader>fn <C-R>=expand("%:t:r:r")<CR>

" Command-T settings
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowReverse=1
nnoremap <Leader>nt :tabnew<CR>:CommandT<CR>
nnoremap <Leader>ns :vne<CR>:CommandT<CR>
nnoremap <Leader>nh :sp<CR>:CommandT<CR>
nnoremap <Leader>e :CommandT<CR>

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

" sorvegi szokozok torlese
nnoremap <Leader>wr :%s/\s\+$//e<CR>

" kijelolt szoveg csereje
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" frugitive mappings
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :diffput<CR>:diffupdate<CR>
vnoremap <Leader>gp :diffput<CR>:diffupdate<CR>
nnoremap <Leader>gg0 :diffget //0<CR>:diffupdate<CR>
nnoremap <Leader>gg2 :diffget //2<CR>:diffupdate<CR>
nnoremap <Leader>gg3 :diffget //3<CR>:diffupdate<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

" gist settings
let g:gist_clip_command = 'pbcopy' "mac only
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 1

" syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1

" quickfix list navigation
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" gundo mappings
nnoremap <Leader>tu :GundoToggle<CR>
inoremap <Leader>tu <Esc>:GundoToggle<CR>

" some toggle mappings
nnoremap <Leader>tn :call VimrcToggle('number')<CR>
nnoremap <Leader>tl :call VimrcToggle('list')<CR>
autocmd BufRead,BufNewFile * let b:listCharStyle=1

" Toggle function
function! VimrcToggle(type)
  if a:type == 'number'
    if &number
      set relativenumber
    else
      set number
    endif
  elseif a:type == 'list'
    if b:listCharStyle == 0
      set list
      set listchars=tab:\ \ ,trail:·
      let b:listCharStyle=1
    elseif b:listCharStyle == 1
      set listchars=tab:▸\ ,trail:·
      let b:listCharStyle=2
    elseif b:listCharStyle == 2
      set listchars=tab:▸\ ,eol:¬,trail:·
      let b:listCharStyle=3
    elseif b:listCharStyle == 3
      set nolist
      let b:listCharStyle=0
    endif
  endif
endfunction

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

if has("autocmd")
  " Drupal *.module, *.test and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END

  augroup text
    autocmd BufRead,BufNewFile *.markdown set noexpandtab
    autocmd BufRead,BufNewFile *.markdown set tabstop=4
    autocmd BufRead,BufNewFile *.markdown set softtabstop=4
    autocmd BufRead,BufNewFile *.markdown set shiftwidth=4
    autocmd BufRead,BufNewFile *.markdown let b:listCharStyle=1
    autocmd BufRead,BufNewFile *.markdown call VimrcToggle('list')
  augroup END
endif

autocmd FileType css call SuperTabSetDefaultCompletionType("<c-x><c-o>")

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost vimrc source $MYVIMRC
endif
