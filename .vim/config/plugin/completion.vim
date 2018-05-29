if has('nvim')
	" Shougo/deoplete.nvim {{{
	Plug 'Shougo/deoplete.nvim', {
				\ 'do': ':UpdateRemotePlugins',
				\ 'on': []
				\}


	let g:deoplete#omni#input_patterns = {}
	let g:deoplete#omni#input_patterns.c =
				\ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
	let g:deoplete#omni#input_patterns.cpp =
				\ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
	let g:deoplete#omni#input_patterns.objc =
				\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
	let g:deoplete#omni#input_patterns.objcpp =
				\ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
	let g:deoplete#omni#input_patterns.javascript = '[^. \t]\.\w*'
	let g:deoplete#omni#input_patterns.perl = 
				\ '\h\w*->\h\w*\|\h\w*::'
	let g:deoplete#omni#input_patterns.ruby =
				\ ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']
	let g:deoplete#omni#input_patterns.java =
				\ '[^. *\t]\.\w*'
	let g:deoplete#omni#input_patterns.php =
				\ '\w+|[^. \t]->\w*|\w+::\w*'

	let g:deoplete#enable_at_startup = 1
	let g:deoplete#omni#functions = {}
	let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
	let g:deoplete#omni#functions.javascript = [
				\ 'tern#Complete',
				\ 'jspc#omni'
				\]

	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

	augroup load_deoplete
		autocmd!
		autocmd InsertEnter * call plug#load('deoplete.nvim')
					\ | autocmd! load_deoplete
	augroup END
	" }}}
else
	"Shougo/vimproc.vim {{{
	Plug 'Shougo/vimproc.vim', { 'do': 'make' }
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

		inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
		inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

		" AutoComplPop like behavior.
		"let g:neocomplete#enable_auto_select = 1

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
endif

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
"Shougo/echodoc.vim {{{
Plug 'Shougo/echodoc.vim', { 'on' : [] }
let g:echodoc_enable_at_startup=1
augroup load_echodoc
	autocmd!
	autocmd InsertEnter * call plug#load('echodoc.vim')
				\ | autocmd! load_echodoc
augroup END
"}}}

" autozimu/LanguageClient-neovim {{{
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }, 

let g:LanguageClient_serverCommands = {
			\ 'cpp': ['cquery', '--log-file=/tmp/cq.log', '--init', '{"cacheDirectory": "/tmp/cquery"}'],
			\ 'c': ['cquery', '--log-file=/tmp/cq.log', '--init', '{"cacheDirectory": "/tmp/cquery"}'],
			\ 'php': ['php-language-server.php'],
			\ }


" Enable omni completion.
let g:LanguageClient_autoStart = 1

nnoremap <silent> <space>h :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <space>d :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <space>r :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <space>* :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <space># :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <space>f :call LanguageClient_textDocument_formatting()<CR>
vnoremap <silent> <space>f :call LanguageClient_textDocument_rangeFormatting()<CR>
vnoremap <silent> <space>s :call LanguageClient_textDocument_documentSymbol()<CR>
vnoremap <silent> <space>S :call LanguageClient_workspace_symbol()<CR>
" }}}

autocmd! FileType cpp setlocal omnifunc=LanguageClient#complete 
autocmd! FileType php setlocal omnifunc=LanguageClient#complete 

autocmd! FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd! FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd! FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


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

" set modeline
" vim: foldlevel=0 foldmethod=marker
