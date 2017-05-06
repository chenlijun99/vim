" 'vim-syntastic/syntastic' {{{
Plug 'vim-syntastic/syntastic', {'for' : 'asciidoc'}
let g:syntastic_asciidoc_checkers = ["asciidoctor", "asciidoc"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_quiet_messages = { "level":  "warning" }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}

"w0rp/ale {{{
Plug 'w0rp/ale'
let g:ale_enabled=1
let g:ale_set_loclist=1
let g:ale_open_list=0
let g:ale_sign_column_always=1
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=0
let g:ale_linters = {
			\ 'javascript': ['jshint'],
			\ 'cpp': ['clang','gcc'],
			\ 'java': ['javac'],
			\ 'html': ['htmlhint']
\}
"}}}
