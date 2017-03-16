setlocal omnifunc=javacomplete#Complete

" compile
nnoremap <buffer> <leader>b :!javac %:t<cr>
" execute
nnoremap <buffer> <leader>r :execute "normal ,b"<cr>:!java %:t:r<cr>

call SetupCamelCaseMotion()
" set modeline 
" vim: foldlevel=0 foldmethod=marker
