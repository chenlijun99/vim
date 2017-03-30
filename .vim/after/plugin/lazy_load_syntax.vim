syntax off
augroup load_syntax
	autocmd!
	autocmd CursorHold * syntax on | autocmd! load_syntax
augroup END
