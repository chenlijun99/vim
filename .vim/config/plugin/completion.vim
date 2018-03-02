if has('nvim')
	" Shougo/deoplete.nvim {{{
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
	" }}}
else
	"Shougo/vimproc.vim {{{
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }
	"}}}
	"Shougo/echodoc.vim {{{
	Plug 'Shougo/echodoc.vim', { 'on' : [] }
	let g:echodoc_enable_at_startup=1
	augroup load_echodoc
		autocmd!
		autocmd InsertEnter * call plug#load('echodoc.vim')
					\ | autocmd! load_echodoc
	augroup END
	"}}}
	" {{{ Shougo/neocomplete
	if has("lua")
		Plug 'Shougo/neocomplete' , { 'on' : [] }
		augroup load_neocomplete
			autocmd!
			autocmd InsertEnter * call plug#load('neocomplete')
						\ | autocmd! load_neocomplete
		augroup END
		autocmd! User neocomplete call neocomplete#init#enable()

		"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
		let g:neocomplete#use_vimproc = 1
		" Disable AutoComplPop.
		let g:acp_enableAtStartup = 0
		" Use neocomplete.
		let g:neocomplete#enable_at_startup = 1
		" Use smartcase.
		let g:neocomplete#enable_smart_case = 1
		" Set minimum syntax keyword length.
		let g:neocomplete#sources#syntax#min_keyword_length = 3

		" Define dictionary.
		let g:neocomplete#sources#dictionary#dictionaries = {
					\ 'default' : '',
					\ 'vimshell' : $HOME.'/.vimshell_hist',
					\ 'scheme' : $HOME.'/.gosh_completions'
					\ }

		" Define keyword.
		if !exists('g:neocomplete#keyword_patterns')
			let g:neocomplete#keyword_patterns = {}
		endif
		let g:neocomplete#keyword_patterns['default'] = '\h\w*'

		" Plugin key-mappings.
		inoremap <expr><C-g>     neocomplete#undo_completion()
		inoremap <expr><C-l>     neocomplete#complete_common_string()

		" Recommended key-mappings.
		" <CR>: close popup and save indent.
		inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
		function! s:my_cr_function()
			return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
			" For no inserting <CR> key.
			"return pumvisible() ? "\<C-y>" : "\<CR>"
		endfunction
		" <TAB>: completion.
		inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
		inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
		" <C-h>, <BS>: close popup and delete backword char.
		inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
		" Close popup by <Space>.
		"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

		" AutoComplPop like behavior.
		"let g:neocomplete#enable_auto_select = 1

		" Enable omni completion.
		"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
		"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
		"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
		"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
		"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

		" Enable heavy omni completion.
		if !exists('g:neocomplete#force_omni_input_patterns')
			let g:neocomplete#force_omni_input_patterns = {}
		endif
		let g:neocomplete#force_omni_input_patterns.c =
					\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
		let g:neocomplete#force_omni_input_patterns.cpp =
					\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
		let g:neocomplete#force_omni_input_patterns.objc =
					\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
		let g:neocomplete#force_omni_input_patterns.objcpp =
					\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
		let g:neocomplete#force_omni_input_patterns.java = '\h\w*\.\w*'
		let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
		let g:neocomplete#force_omni_input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	endif
	" }}}
	" {{{ Shougo/neosnippet
	Plug 'Shougo/neosnippet' , { 'on' : [] }
	Plug 'Shougo/neosnippet-snippets'
	augroup load_neosnippet
		autocmd!
		autocmd InsertEnter * call plug#load('neosnippet')
					\ | autocmd! load_neosnippet
	augroup END

	autocmd! User neosnippet call neosnippet#init#_initialize()

	let g:neosnippet#snippets_directory = ['~/.vim/snippets/']
	" Plugin key-mappings.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)

	" SuperTab like snippets behavior.
	" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	"imap <expr><TAB>
	" \ pumvisible() ? "\<C-n>" :
	" \ neosnippet#expandable_or_jumpable() ?
	" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

	" For conceal markers.
	"if has('conceal')
	"set conceallevel=2 concealcursor=niv
	"endif
	" }}}
endif

" autozimu/LanguageClient-neovim {{{
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

let g:LanguageClient_serverCommands = {
			\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
			\ 'javascript': ['javascript-typescript-stdio'],
			\ 'javascript.jsx': ['javascript-typescript-stdio'],
			\ }

" }}}
" set modeline
" vim: foldlevel=0 foldmethod=marker
