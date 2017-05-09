syntax off
augroup load_syntax
	autocmd!
	autocmd CursorHold * syntax on | call lightline#enable() | autocmd! load_syntax
augroup END
