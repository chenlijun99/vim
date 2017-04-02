let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

setlocal tabstop=2
setlocal shiftwidth=2
setlocal foldmethod=indent
setlocal foldnestmax=10
setlocal nolist

nnoremap <buffer> <leader>r :silent !chromium-browser % > /dev/null &<cr><c-l>
