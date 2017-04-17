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

"'vim-scripts/OmniCppComplete' {{{
Plug 'vim-scripts/OmniCppComplete', { 'for' : 'cpp' }
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

" qmake {{{
Plug 'artoj/qmake-syntax-vim' , { 'for' : 'qmake'}
" }}}
"
" set modeline 
" vim: foldlevel=0 foldmethod=marker
