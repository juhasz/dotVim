set background=dark
colorscheme solarized
set guifont=monaco:h16
set guioptions=egmrt

" sorvegi szokozok automatikus kiemelese
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
