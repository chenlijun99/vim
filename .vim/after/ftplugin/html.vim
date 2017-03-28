let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

setlocal tabstop=2
setlocal foldmethod=indent
setlocal foldnestmax=10

nnoremap <buffer> <silent> <leader>r :!chromium-browser % > /dev/null &<cr>
