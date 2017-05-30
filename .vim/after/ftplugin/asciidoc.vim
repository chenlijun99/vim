nnoremap <buffer> <leader>r :QuickRun<cr>

setlocal spell spelllang=en,it
" toggle spell-checking
nnoremap <buffer> <leader>c :setl spell!<cr>

setlocal lazyredraw
"autocmd! InsertEnter * setlocal syntax=
"autocmd! InsertLeave * setlocal syntax=asciidoc


" set modeline 
" vim: foldlevel=0 foldmethod=marker
