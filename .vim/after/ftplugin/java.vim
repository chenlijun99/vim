setlocal omnifunc=javacomplete#Complete

nnoremap <buffer> <leader>r :call Run()<cr>

function! Run()
	let mainFile = JavaMain()
	let mainExecutable = substitute(mainFile, "\.java$", "", "")
	
	"execute 'Start javac ' . expand('%') . ' && javac ' . mainFile . ' && ' . 'java ' . mainExecutable
	execute 'Start javac ' . mainFile . ' && ' . 'java ' . mainExecutable
endfunction

function! JavaMain()
	" plural of main -> mains
	let mains = taglist('main')

	if len(mains) == 0
		echo "Main method not found"
		return

	elseif len(mains) == 1
		return mains['filename']

	elseif len(mains) > 1
		let message = ""
		let index = 0
		for main in mains
			let message .= "(" . index . ") " . main['filename'] . "\n"
			let index += 1
		endfor
		echo message

		let userinput = input("\nSelect one candidate: ", '')
		if empty(userinput)
			return mains[0]
		elseif userinput >=0 && userinput < len(mains)
			return mains[userinput]['filename']
		else
			echoerr "Invalid selections"
		endif
	endif
endfunction

" set modeline 
" vim: foldlevel=0 foldmethod=marker
