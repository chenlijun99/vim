" compile
nnoremap <buffer> <leader>b :!g++ %:p -o %:p:r -std=c++0x -Wall -ggdb<cr>
" execute
nnoremap <buffer> <leader>r :!g++ %:p -o %:p:r -std=c++0x -Wall<cr>:!./%:r<cr>

if g:LanguageClient_loaded
	setlocal omnifunc=LanguageClient#complete
	nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
	nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>
	nnoremap <buffer> <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endif

"setlocal omnifunc=omni#cpp#complete#Main
"setlocal tags+=~/.vim/tags/std_tags

" set modeline 
" vim: foldlevel=0 foldmethod=marker
