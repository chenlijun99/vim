nnoremap <buffer> <silent> <leader>r :!chromium-browser % &<cr>
nnoremap <buffer> <silent> <leader>R :!asciidoctor %<cr>:!chromium-browser %:r.html &<cr>
setlocal spell spelllang=en,it

" toggle spell-checking
nnoremap <buffer> <leader>c :setl spell!<cr>
" set modeline 
" vim: foldlevel=0 foldmethod=marker
