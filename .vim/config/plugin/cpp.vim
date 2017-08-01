" 'octol/vim-cpp-enhanced-highlight' {{{
Plug 'octol/vim-cpp-enhanced-highlight', { 'for' : 'cpp' }
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}

" Rip-Rip/clang_complete {{{
Plug 'Rip-Rip/clang_complete', { 'for': 'cpp' }
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_compilation_database = "./build/"
" }}}

" qmake {{{
Plug 'artoj/qmake-syntax-vim' , { 'for' : 'qmake'}
" }}}
"
" set modeline 
" vim: foldlevel=0 foldmethod=marker
