Plug 'ternjs/tern_for_vim' , { 'do' : 'npm install',
			\'for' : 'javascript' }
let g:tern#arguments = ["--persistent"]
let g:tern_show_signature_in_pum = 1
let g:tern_show_argument_hints = 1

Plug 'pangloss/vim-javascript' , { 'for' : 'javascript' }

Plug 'moll/vim-node' , { 'for' : 'javascript' }
