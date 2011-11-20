" ZZZ is just a little plugin, witch sourced after the other plugins, so you
" can overwrite some default values here.

" remap vim-latex-s <c-j> to my own
nnoremap <c-j> <c-w>j

" formatoptions after ftplugins
autocmd BufRead,BufNewFile *.{module,install,test,inc,profile,php} setlocal formatoptions=clorq
autocmd BufRead,BufNewFile *.{module,install,test,inc,profile,php} setlocal comments=s1:/*,mb:*,ex:*/,://,:#
