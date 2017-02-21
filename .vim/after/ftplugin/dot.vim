let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

nnoremap <buffer> <silent> <leader>b :!dot -Tsvg % -o %:r.svg<cr>
nnoremap <buffer> <silent> <leader>R :!dot -Tsvg % -o %:r.svg<cr>:!eog %:r.svg &<cr>
nnoremap <buffer> <silent> <leader>r :!dot -Tsvg % -o %:r.svg<cr>:!eog %:r.svg &<cr>
nnoremap <buffer> <silent> <leader>rn :!neato -Tsvg % -o %:r.svg<cr>:!eog %:r.svg &<cr>
