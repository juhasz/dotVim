set background=dark
colorscheme solarized
set guifont=menlo:h13
set guioptions=egt
call togglebg#map("<F5>")

" sorvegi szokozok automatikus kiemelese
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
