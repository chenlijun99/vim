" 'octol/vim-cpp-enhanced-highlight' {{{
Plug 'octol/vim-cpp-enhanced-highlight', { 'for' : 'cpp' }
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}}

" justmao945/vim-clang {{{
Plug 'justmao945/vim-clang' , { 'for' : 'cpp'}
let g:clang_cpp_completeopt = 'menuone,noselect'
let g:clang_diagsopt = '' " disable diagnostic
" }}}

" qmake {{{
Plug 'artoj/qmake-syntax-vim' , { 'for' : 'qmake'}
" }}}
"
" set modeline 
" vim: foldlevel=0 foldmethod=marker
