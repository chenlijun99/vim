" compile
nnoremap <buffer> <leader>b :!g++ %:t -o %:r -std=c++0x -Wall -ggdb<cr>
" execute
nnoremap <buffer> <leader>r :!g++ %:t -o %:r -std=c++0x -Wall<cr>:!./%:r<cr>

setlocal omnifunc=omni#cpp#complete#Main
setlocal tags+=~/.vim/tags/std_tags
" set modeline 
" vim: foldlevel=0 foldmethod=marker
