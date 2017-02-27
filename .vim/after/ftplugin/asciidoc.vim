nnoremap <buffer> <silent> <leader>r :!chromium-browser % > /dev/null &<cr>

function! Build()
	if filereadable("./Makefile")
		make
		execute("!chromium-browser *.html > /dev/null &")
	else
		execute("!asciidoctor % &")
		execute("!chromium-browser %:r.html /dev/null &")
	endif
endfunction

nnoremap <buffer> <silent> <leader>R :call Build()<cr>

setlocal spell spelllang=en,it
" toggle spell-checking
nnoremap <buffer> <leader>c :setl spell!<cr>

setlocal lazyredraw
"autocmd! InsertEnter * setlocal syntax=
"autocmd! InsertLeave * setlocal syntax=asciidoc


" set modeline 
" vim: foldlevel=0 foldmethod=marker
