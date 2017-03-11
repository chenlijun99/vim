nnoremap <buffer> <silent> <leader>r :!chromium-browser % > /dev/null &<cr>

nnoremap <buffer> <silent> <leader>R :!pandoc -o %:r.html %<cr>:!chromium-browser %:r.html > /dev/null &<cr>

" toggle spell-checking
nnoremap <buffer> <leader>c :setl spell!<cr>
setlocal spell spelllang=en,it

setlocal lazyredraw

" set modeline 
" vim: foldlevel=0 foldmethod=marker
