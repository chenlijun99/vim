"_________ .__                                    .__                       
"\_   ___ \|  |__   ____   ____             ___  _|__| ____________   ____  
"/    \  \/|  |  \_/ __ \ /    \   ______   \  \/ /  |/     \_  __ \_/ ___\ 
"\     \___|   Y  \  ___/|   |  \ /_____/    \   /|  |  Y Y  \  | \/\  \___ 
" \______  /___|  /\___  >___|  /          /\ \_/ |__|__|_|  /__|    \___  >
"        \/     \/     \/     \/           \/              \/            \/ 

" enable vim features, which are not supported by vi
set nocompatible

let mapleader=","

" My mappings and commands {{{
inoremap jk <Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" edit ftplugin for current filetype
nnoremap <leader>ef :execute printf("vsplit ~/.vim/after/ftplugin/%s.vim", &filetype)<cr>
nnoremap <leader>sf :execute printf("source ~/.vim/after/ftplugin/%s.vim", &filetype)<cr>

" edit snippets for current filetype
nnoremap <leader>es :execute printf("vsplit ~/.vim/snippets/%s.snip", &filetype)<cr>
nnoremap <leader>ss :execute printf("source ~/.vim/snippets/%s.snip", &filetype)<cr>

" turn off the search highlight
nnoremap <silent> <CR> :nohlsearch<CR>
command! W :w !sudo tee %

"}}}

" Settings {{{
" set default clipboard as system clipboard
set clipboard=unnamedplus
" enable the use of mouse for [a]ll the mode
set mouse=a
" show a menu of possible completion, when pressing tab in command mode
set wildmenu
set wildmode=full
" highlight the current line
set cursorline
" show line number
set number
" show the line number distance of each line relative to the current one
set relativenumber
" don't wrap even when a line is longer than the width of the window
set nowrap
" show a vertical line at the 80th column
set colorcolumn=80
" show the completion as complete as possible
set completeopt+=longest
" do not use open a preview window of completion (it's laggy)
set completeopt-=preview

" search {{{
" highlight searched pattern
set hlsearch
" highlight searched pattern as it's typed
set incsearch
set ignorecase
" when the search pattern contains uppercase chars, then do not ignore case
set smartcase
"}}}

" indent {{{
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set list listchars=tab:\▸\ 
"}}}

" colorscheme & font {{{
set t_Co=256
colorscheme gruvbox
set background=dark

set guifont=DejaVu\ Sans\ Mono\ 12
"}}}
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

	" Useful plugins {{{

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
	
	" Sidebars {{{

	" sidepanel will handle the underlying plugin
	" 'miyakogi/sidepanel.vim' {{{
	Plug 'miyakogi/sidepanel.vim'

	let g:sidepanel_pos = "left"
	let g:sidepanel_width = 20
	let g:sidepanel_use_rabbit_ui = 1
	" Activate plugins in SidePanel
	let g:sidepanel_config = {}
	let g:sidepanel_config['tagbar'] = {}
	let g:sidepanel_config['nerdtree'] = {}

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
				\['NERDTreeToggle',
				\'SidePanel nerdtree',
				\'NERDTreeFind',
				\'NERDTreeClose'] }
	"let g:NERDTreeWinSize=20
	" }}}

	" }}}
	
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
	" }}}
	"}}}

	" Language specific plugins {{{
	" c++ {{{
	" 'octol/vim-cpp-enhanced-highlight' {{{
	Plug 'octol/vim-cpp-enhanced-highlight', { 'for' : 'cpp' }
	let g:cpp_class_scope_highlight = 1
	let g:cpp_member_variable_highlight = 1
	let g:cpp_experimental_template_highlight = 1
	let g:cpp_concepts_highlight = 1
	" }}}

	"'vim-scripts/OmniCppComplete' {{{
	Plug 'vim-scripts/OmniCppComplete', { 'for' : 'cpp' }
				"\{'on_ft' : ['cpp']})
	let OmniCpp_NamespaceSearch = 1
	let OmniCpp_GlobalScopeSearch = 1
	let OmniCpp_ShowAccess = 1
	let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
	let OmniCpp_MayCompleteDot = 1  	" autocomplete after .
	let OmniCpp_MayCompleteArrow = 1  	" autocomplete after ->
	let OmniCpp_MayCompleteScope = 1  	" autocomplete after ::
	let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
	let OmniCpp_LocalSearchDecl = 1  	" use local search function, bracket on 1st column
	"}}}
	"}}}

	" java {{{
	Plug 'artur-shaik/vim-javacomplete2'
	" }}}
	
	"Web {{{
	" javascript {{{
	Plug 'pangloss/vim-javascript' , { 'for' : 'javascript' }
	Plug 'othree/javascript-libraries-syntax.vim', { 'for' : 'javascript' }
	" }}}
	
	"typescript {{{
	Plug 'leafgarland/typescript-vim' , { 'for' : 'typescript' }
	Plug 'Quramy/tsuquyomi' , { 'for' : 'typescript'}
	"}}}

	" css {{{
	"
	" }}}
	
	"html {{{
	" html omnifunc
	Plug 'othree/html5.vim', { 'for' : 'html' }

	Plug 'mattn/emmet-vim', { 'for' : 'html' }
	let g:user_emmet_leader_key = ',e'

	Plug 'alvan/vim-closetag', { 'for' : 'html' }
	let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
	" }}}
	
	"}}}

	" graphviz {{{
	" graphviz omnifunc
	Plug 'wannesm/wmgraphviz.vim', { 'for' : 'dot' }
				"\{'on_ft' : ['dot']})
	" }}}

	" R {{{
	"jalvesaq/Nvim-R {{{
	Plug 'jalvesaq/Nvim-R', { 'for' : 'rout'} 
	"}}}
	" }}}

	" latex {{{
	Plug 'vim-latex/vim-latex', { 'for' : ['tex', 'latex', 'plaintex']}
				"\{'on_ft' : ['latex','plaintex','tex']})
	"}}}

	" cmake {{{
	Plug 'richq/vim-cmake-completion' , { 'for' : 'cmake' }
				"\{'on_ft' : ['cmake']})
	"}}}

	" json {{{
	Plug 'elzr/vim-json'
	let g:vim_json_syntax_conceal = 0
	" }}}
	
	" {{{ vim
	"Shougo/neco-vim {{{
	Plug 'Shougo/neco-vim', { 'for' : 'vim' }
	"}}}
	" }}}
	"}}}

	" Syntax checker {{{

	" 'vim-syntastic/syntastic' {{{
	Plug 'vim-syntastic/syntastic', {'for' : 'asciidoc'}
    let g:syntastic_auto_loc_list = 1

	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	" }}}

	"w0rp/ale {{{
	Plug 'w0rp/ale'
	let g:ale_set_loclist=1
	let g:ale_sign_column_always=1
	let g:ale_lint_on_text_changed=0
	let g:ale_lint_on_enter=0
	let g:ale_lint_on_save=1
	"}}}
	" }}}

call plug#end()

filetype plugin indent on    	" required by dein
syntax on						" enables syntax highlighting
" }}}

" Buffer and window {{{
set hidden
"}}}

" Folding {{{

set foldenable	" enable folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=1
set foldnestmax=1

nnoremap <Space> za<Space>
""}}}

" Status line {{{
set laststatus=2

set statusline=
set statusline+=%f         " Path to the file
set statusline+=\ -\      " Separator
set statusline+=FileType: " Label
set statusline+=%y        " Filetype of the file
" }}}

" set modeline 
" vim: foldlevel=0 foldmethod=marker

