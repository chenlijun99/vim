Plug 'othree/html5.vim', { 'for' : 'html' }

Plug 'mattn/emmet-vim', { 'for' : 'html' }
let g:user_emmet_leader_key = ',e'

" marked as frozen since there are custom modification
" to allow proper lazy load
Plug 'alvan/vim-closetag' , { 'for' : 'html',
			\ 'frozen' : 'true' }
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

Plug 'gregsexton/MatchTag' , { 'for' : 'html' }

Plug 'chrisgillis/vim-bootstrap3-snippets/', { 'for' : 'html' }
