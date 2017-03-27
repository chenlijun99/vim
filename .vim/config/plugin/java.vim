Plug 'artur-shaik/vim-javacomplete2', { 'on' : [] }
augroup load_javacomplete
	autocmd!
	autocmd! FileType java
				\ autocmd! BufEnter * call plug#load('vim-javacomplete2') 
				\ | autocmd! load_javacomplete
augroup END

	
" set modeline 
" vim: foldlevel=0 foldmethod=marker
