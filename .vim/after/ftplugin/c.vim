" compile
nnoremap <buffer> <leader>b :!gcc %:t -o %:r -Wall -ggdb<cr>
" execute
nnoremap <buffer> <leader>r :!gcc %:t -o %:r -Wall<cr>:!./%:r<cr>

" set modeline 
" vim: foldlevel=0 foldmethod=marker
