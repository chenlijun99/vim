
"Shougo/vimproc.vim {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"}}}
"Shougo/neopairs.vim {{{
Plug 'Shougo/neopairs.vim'
"}}}
"Shougo/echodoc.vim {{{
Plug 'Shougo/echodoc.vim'
"}}}
"Shougo/denite.nvim {{{
function! SetupDenite()
	call denite#custom#map(
				\ 'insert',
				\ 'jk',
				\ '<denite:enter_mode:normal>',
				\ 'noremap'
				\)
	highlight deniteMatchedChar term=standout cterm=bold ctermfg=167 gui=bold guifg=#fb4934
	highlight deniteMatchedRange term=standout cterm=bold ctermfg=167 gui=bold guifg=#fb4934

endfunction

Plug 'Shougo/denite.nvim' , { 'on' : ['DeniteProjectDir',
			\'Denite'] }
autocmd! User denite.nvim call SetupDenite()
nmap <c-p> :DeniteProjectDir buffer file_rec<cr>
"}}}
" {{{ Shougo/neocomplete
Plug 'Shougo/neocomplete'
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
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
" {{{ Shougo/neosnippet
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
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

" Sidepanel {{{

" sidepanel will handle the underlying plugin
" 'miyakogi/sidepanel.vim' {{{
Plug 'miyakogi/sidepanel.vim'

let g:sidepanel_pos = "left"
let g:sidepanel_width = 20
let g:sidepanel_use_rabbit_ui = 1
" Activate plugins in SidePanel
let g:sidepanel_config = {}
let g:sidepanel_config['nerdtree'] = {
			\  'filetype': 'nerdtree',
			\  'open': ['NERDTree'],
			\  'close': ['NERDTreeClose'],
			\  'position': {
			\    'var': 'g:NERDTreeWinPos',
			\    'param': {
			\      'left': 'left',
			\      'right': 'right',
			\    },
			\  },
			\  'size': {
			\    'var': 'g:NERDTreeWinSize',
			\  },
			\}
let g:sidepanel_config['tagbar'] = {
			\  'bufname': '__Tagbar__',
			\  'filetype': 'tagbar',
			\  'open': ['TagbarOpen'],
			\  'close': ['TagbarClose'],
			\  'position': {
			\    'var': 'g:tagbar_left',
			\    'param': {
			\      'left': 1,
			\      'right': 0,
			\    },
			\  },
			\  'size': {
			\    'var': 'g:tagbar_width',
			\  },
			\}

nnoremap so :SidePanel tagbar<cr>
nnoremap sf :SidePanel nerdtree<cr>
nnoremap S :SidePanelClose<cr>
"}}}

" 'majutsushi/tagbar' {{{
Plug 'majutsushi/tagbar', { 'on' : 
			\['TagbarToggle',
			\'SidePanel tagbar',
			\'TagbarOpen',
			\'TagbarClose']}
let g:tagbar_left=1
" }}}

" 'scrooloose/nerdtree' {{{
Plug 'scrooloose/nerdtree' , { 'on' :
			\['NERDTree',
			\'NERDTreeToggle',
			\'SidePanel nerdtree',
			\'NERDTreeFind',
			\'NERDTreeClose'] }
" }}}

" }}}

" Valloric/YouCompleteMe {{{
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',
			\ 'for' : ['cpp','c','javascript']}
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
" }}}

"bkad/CamelCaseMotion {{{
Plug 'bkad/CamelCaseMotion'
function! g:SetupCamelCaseMotion()
	map <silent> w <Plug>CamelCaseMotion_w
	map <silent> b <Plug>CamelCaseMotion_b
	map <silent> e <Plug>CamelCaseMotion_e
	map <silent> ge <Plug>CamelCaseMotion_ge
	sunmap w
	sunmap b
	sunmap e
	sunmap ge
	omap <silent> iw <Plug>CamelCaseMotion_iw
	xmap <silent> iw <Plug>CamelCaseMotion_iw
	omap <silent> ib <Plug>CamelCaseMotion_ib
	xmap <silent> ib <Plug>CamelCaseMotion_ib
	omap <silent> ie <Plug>CamelCaseMotion_ie
	xmap <silent> ie <Plug>CamelCaseMotion_ie
endfunction

"}}}

"tpope/vim-fugitive {{{
Plug 'tpope/vim-fugitive'
"}}}

"xuyuanp/nerdtree-git-plugin {{{
Plug 'xuyuanp/nerdtree-git-plugin'
"}}}

"tpope/vim-surround {{{
Plug 'tpope/vim-surround'
"}}}

" 'ervandew/supertab' {{{
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" 'scrooloose/nerdcommenter' {{{
Plug 'scrooloose/nerdcommenter'
"}}}

" 'bling/vim-bufferline' {{{
Plug 'bling/vim-bufferline'
let g:bufferline_echo = 1
let g:bufferline_active_buffer_left = '['
" }}}

" 'Valloric/ListToggle' {{{
Plug 'Valloric/ListToggle'
let g:lt_height=10	" set location list height

"" toggle location list and go back to the previous window
"nnoremap <silent> <leader>l :LToggle<cr><c-w><c-p>
nnoremap <leader>j :lnext<cr>
nnoremap <leader>k :lprevious<cr>
"}}}

" istib/vifm.vim {{{
Plug 'istib/vifm.vim'
nnoremap <leader>o :EditVifm<cr>
" }}}

" 'terryma/vim-multiple-cursors' {{{
Plug 'terryma/vim-multiple-cursors'
" }}}

" 'embear/vim-localvimrc' {{{
Plug 'embear/vim-localvimrc'
" }}}

" 'romgrk/winteract.vim' {{{

" add window mode to vim
Plug 'romgrk/winteract.vim' , { 'on' : 'InteractiveWindow' }
nnoremap <leader>w :InteractiveWindow<cr>
function! SetupWinteract()
	let g:winmap.normal = {
				\ "\<c-h>": "normal! \<C-w><" , "=": "normal! \<C-w>=" ,
				\ "\<c-j>": "normal! \<C-w>-" , "f": "normal! \<C-w>_" ,
				\ "\<c-k>": "normal! \<C-w>+" , "F": "normal! \<C-w>|" ,
				\ "\<c-l>": "normal! \<C-w>>" , "o": "normal! \<C-w>o" ,
				\
				\ "|": "exe g:winmode.count.'wincmd |'",
				\ "\\": "exe g:winmode.count.'wincmd _'",
				\ "&": "normal! :\<C-r>=&tw\<CR>wincmd |\<CR>" ,
				\ 
				\ "h": "normal! \<C-w>h" ,  "H": "normal! \<C-w>H" ,
				\ "j": "normal! \<C-w>j" ,  "J": "normal! \<C-w>J" ,
				\ "k": "normal! \<C-w>k" ,  "K": "normal! \<C-w>K" ,
				\ "l": "normal! \<C-w>l" ,  "L": "normal! \<C-w>L" ,
				\
				\ "x": "normal! \<C-w>c" , "n": "normal! :bn\<CR>" ,
				\ "c": "normal! \<C-w>c" , "p": "normal! :bp\<CR>" ,
				\ "s": "normal! \<C-w>s" , "\<TAB>": "normal! :bn\<CR>" ,
				\ "v": "normal! \<C-w>v" , "\<S-TAB>": "normal! :bp\<CR>" ,
				\ 
				\ "w": "normal! \<C-w>w" , "\<A-w>": "normal! \<C-w>p" ,
				\ "W": "normal! \<C-w>W" ,
				\ "q": "normal! :copen\<CR>" ,
				\
				\ "m": "let g:winmode.submode='move'" ,
				\ ":": "let g:winmode.submode='set'" ,
				\ "t": "let g:winmode.submode='tab'" ,
				\
				\ "d": "bdelete" ,
				\ ";": "terminal" ,
				\
				\ "\<ESC>": "let exitwin=1" ,
				\ "\<CR>": "let exitwin=1" ,
				\}

	let g:winmap.move = {
				\ "h": "normal! \<C-w>H" ,
				\ "j": "normal! \<C-w>J" ,
				\ "k": "normal! \<C-w>K" ,
				\ "l": "normal! \<C-w>L" ,
				\ "x": "normal! \<C-w>x" ,
				\ "r": "normal! \<C-w>r" ,
				\ "\<ESC>": "\" NOP" ,
				\ }

	let g:winmap.set = {
				\ "w": "exe g:winmode.count.'wincmd |'",
				\ "h": "exe g:winmode.count.'wincmd _'",
				\ "W": "wincmd |",
				\ "H": "wincmd _",
				\ "\<ESC>": "let resetmode=1" ,
				\ }

	let g:winmap.tab = {
				\ "o": "tab sview %" ,
				\ "e": "tabnew" ,
				\ "x": "tabclose" ,
				\ "n": "tabnext" ,
				\ "p": "tabprevious" ,
				\
				\ "w": "let g:winmode.submode='normal'" ,
				\ "\<ESC>": "let exitwin=1" ,
				\ }
endfunction
autocmd! User winteract.vim call SetupWinteract()
"}}}

" 'Konfekt/FastFold' {{{
" lazy fold recomputing
Plug 'Konfekt/FastFold'
" }}}

"'jiangmiao/auto-pairs' {{{
Plug 'jiangmiao/auto-pairs'
"}}}

"'easymotion/vim-easymotion' {{{
Plug 'easymotion/vim-easymotion'

" m for move
map m <Plug>(easymotion-prefix)
map mm ms
"}}}

" 'airblade/vim-rooter' {{{
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_resolve_links = 1
" }}}

"'KabbAmine/zeavim.vim' {{{
Plug 'KabbAmine/zeavim.vim', {'on': [
            \   'Zeavim', 'Docset',
            \   '<Plug>Zeavim',
            \   '<Plug>ZVVisSelection',
            \   '<Plug>ZVKeyDocset',
            \   '<Plug>ZVMotion'
            \ ]}

nnoremap K :Zeavim<cr>
vnoremap K :Zeavim<cr>
nnoremap <leader>k :Zeavim!<cr><cr>
nnoremap <leader>K :Zeavim!<cr><c-w>

let g:zv_disable_mapping = 1
let g:zv_file_types = {
			\ 'cpp'				:	'cpp,qt',
			\ 'cmake'			:	'cmake',
			\ '(plain|tex)?tex'	:	'latex',
			\ 'html'			:	'html',
			\ 'css'				:	'css',
			\ 'javascript'		:	'javascript'
			\}

let g:zv_get_docset_by = ['ft', 'ext']
"}}}

" set modeline 
" vim: foldlevel=0 foldmethod=marker
