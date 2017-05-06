
"Shougo/vimproc.vim {{{
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
"}}}
"Shougo/echodoc.vim {{{
Plug 'Shougo/echodoc.vim'
"}}}
" {{{ Shougo/neocomplete
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
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
" {{{ Shougo/neosnippet
Plug 'Shougo/neosnippet' , { 'on' : [] }
augroup load_neosnippet
	autocmd!
	autocmd InsertEnter * call plug#load('neosnippet') 
				\ | autocmd! load_neosnippet
augroup END

autocmd! User neocomplete call neocomplete#init#enable()
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

" junegunn/fzf.vim {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-p> :FzfGFiles<cr>
let g:fzf_command_prefix = 'Fzf'

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '37%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
" }}}
" junegunn/goyo.vim {{{
Plug 'junegunn/goyo.vim' , { 'on' : ['Goyo', 'Goyo!'] }
" }}}
" junegunn/vim-slash {{{
Plug 'junegunn/vim-slash'
" }}}
" junegunn/rainbow_parentheses.vim {{{
Plug 'junegunn/rainbow_parentheses.vim'
" }}}

" Sidepanel {{{

" 'majutsushi/tagbar' {{{
Plug 'majutsushi/tagbar', { 'on' : 
			\['TagbarToggle',
			\'SidePanel tagbar',
			\'TagbarOpen',
			\'TagbarClose']}
let g:tagbar_left=0
let g:tagbar_width=20
Plug 'mtscout6/vim-tagbar-css' , { 'on' : [] }
augroup load_tagbar_css
	autocmd!
	autocmd FileType css
				\ autocmd User tagbar call plug#load('vim-tagbar-css')
				\ | autocmd! load_tagbar_css
augroup END
" }}}

" 'scrooloose/nerdtree' {{{
Plug 'scrooloose/nerdtree' , { 'on' :
			\['NERDTree',
			\'NERDTreeToggle',
			\'SidePanel nerdtree',
			\'NERDTreeFind',
			\'NERDTreeClose'] }
let g:NERDTreeWinSize=20

"xuyuanp/nerdtree-git-plugin {{{
Plug 'xuyuanp/nerdtree-git-plugin' , { 'on' :
			\['NERDTree',
			\'NERDTreeToggle',
			\'SidePanel nerdtree',
			\'NERDTreeFind',
			\'NERDTreeClose'] }
"}}}
" }}}
"
nnoremap so :TagbarToggle<cr>
nnoremap sf :NERDTreeFind<cr>
nnoremap S :TagbarClose<cr>:NERDTreeClose<cr>
" }}}

" tpope/vim-repeat {{{
Plug 'tpope/vim-repeat'
" }}}

"bkad/CamelCaseMotion {{{
Plug 'bkad/CamelCaseMotion' , { 'on' : [] }

function! s:MapCamelCaseMotion()
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

augroup load_camelcasemotion
	autocmd!
	autocmd FileType cpp,java,javascript
				\ autocmd BufEnter * call plug#load('CamelCaseMotion')
				\ | call s:MapCamelCaseMotion()
				\ | autocmd! load_camelcasemotion
augroup END
"}}}

"tpope/vim-fugitive {{{
Plug 'tpope/vim-fugitive' , { 'on' : [] }
augroup load_fugitive
	autocmd!
	autocmd TextChanged,TextChangedI * call plug#load('vim-fugitive') 
				\ | autocmd! load_fugitive
augroup END
autocmd! User vim-fugitive call fugitive#detect(expand('%:p'))
"}}}

" airblade/vim-gitgutter {{{
Plug 'airblade/vim-gitgutter' , { 'on' : [] }
augroup load_vim-gitgutter
	autocmd!
	autocmd TextChanged,TextChangedI * call plug#load('vim-gitgutter') 
				\ | autocmd! load_vim-gitgutter
augroup END
" }}}

"tpope/vim-surround {{{
Plug 'tpope/vim-surround',
      \ { 'on': ['<Plug>Dsurround', '<Plug>Csurround', '<Plug>CSurround',
      \ '<Plug>Ysurround',  '<Plug>YSurround', '<Plug>Yssurround',
      \ '<Plug>YSsurround', '<Plug>VSurround', '<Plug>VgSurround'] }
xmap S <Plug>VSurround
"}}}

" 'ervandew/supertab' {{{
"Plug 'ervandew/supertab' , { 'on' : [] }
"let g:SuperTabDefaultCompletionType = "<c-n>"
"augroup load_supertab
	"autocmd!
	"autocmd InsertEnter * call plug#load('supertab') 
				"\ | autocmd! load_supertab
"augroup END
" }}}

" 'scrooloose/nerdcommenter' {{{
Plug 'scrooloose/nerdcommenter' , { 'on' : '<Plug>NERDCommenterToggle' }
nmap <leader>c<space> <Plug>NERDCommenterToggle
vmap <leader>c<space> <Plug>NERDCommenterToggle
"}}}

" 'bling/vim-bufferline' {{{
Plug 'bling/vim-bufferline'
let g:bufferline_echo = 1
let g:bufferline_active_buffer_left = '['
" }}}

" 'Valloric/ListToggle' {{{
Plug 'Valloric/ListToggle'
" set location list height
let g:lt_height=10
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
nmap <Plug>JumpNextLocationList :lnext<Bar>
			\ silent! call repeat#set("\<Plug>JumpNextLocationList")<cr>
nmap <leader>lj <Plug>JumpNextLocationList
nmap <Plug>JumpPreviousLocationList :lprevious<Bar>
			\ silent! call repeat#set("\<Plug>JumpPreviousLocationList")<cr>
nmap <leader>lk <Plug>JumpPreviousLocationList

nmap <Plug>JumpNextQuickFix :cnext<Bar>
			\ silent! call repeat#set("\<Plug>JumpNextQuickFix")<cr>
nmap <leader>cj <Plug>JumpNextQuickFix
nmap <Plug>JumpPreviousQuickFix :cprevious<Bar>
			\ silent! call repeat#set("\<Plug>JumpPreviousQuickFix")<cr>
nmap <leader>ck <Plug>JumpPreviousQuickFix
"}}}

" istib/vifm.vim {{{
Plug 'istib/vifm.vim' , { 'on' : 'EditVifm' }
nnoremap <leader>o :EditVifm<cr>
" }}}

" 'terryma/vim-multiple-cursors' {{{
Plug 'terryma/vim-multiple-cursors' , { 'on' : 'MultipleCursorsFind' }
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
Plug 'jiangmiao/auto-pairs' , { 'on' : [] }
augroup load_auto-pairs
	autocmd!
	autocmd InsertEnter * call plug#load('auto-pairs') 
				\ | autocmd! load_auto-pairs
augroup END
autocmd! User auto-pairs call AutoPairsInit()
"}}}

"'easymotion/vim-easymotion' {{{
Plug 'easymotion/vim-easymotion' , { 'on' : '<Plug>(easymotion-prefix)' }

" m for move
map m <Plug>(easymotion-prefix)
map mm ms
"}}}

" 'airblade/vim-rooter' {{{
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['package.json', '.git/', '.git']
let g:rooter_targets="*.cpp,*.cxx,*.c,*.hxx,*.hpp,*.java,*.adoc,*.md,*.dot,*.js,*.html,*.css,*.less,*.sass"

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
			\ 'html'			:	'html,bootstrap',
			\ 'css'				:	'css',
			\ 'javascript'		:	'javascript',
			\ 'sh'				:	'bash'
			\}

let g:zv_get_docset_by = ['ft', 'ext']
"}}}

" {{{ 'vim-scripts/fcitx.vim'
Plug 'vim-scripts/fcitx.vim' , { 'on' : [] }
augroup load_fcitx
	autocmd!
	autocmd InsertEnter * call plug#load('fcitx.vim') 
				\ | autocmd! load_fcitx
augroup END
" }}}

" Chiel92/vim-autoformat {{{
Plug 'Chiel92/vim-autoformat' , { 'on' : 'Autoformat' }
" }}}
"
"vim-scripts/SyntaxComplete {{{
Plug 'vim-scripts/SyntaxComplete', { 'on' : [] }

augroup load_syntaxcomplete
	autocmd!
	autocmd InsertEnter * call plug#load('SyntaxComplete') 
				\ | set completefunc=syntaxcomplete#Complete
				\ | autocmd! load_syntaxcomplete
augroup END
"}}}
"
"mileszs/ack.vim {{{
Plug 'mileszs/ack.vim', { 'on' : ['Ack','LAck'] }
nnoremap <leader>f :Ack! 
"}}}

" set modeline 
" vim: foldlevel=0 foldmethod=marker
