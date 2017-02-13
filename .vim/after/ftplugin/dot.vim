let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

nnoremap <buffer> <silent> <leader>b :!dot -Tsvg % -o %:r.svg<cr>
nnoremap <buffer> <silent> <leader>r :!eog %:r.svg &<cr>
