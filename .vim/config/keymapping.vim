let mapleader=","

" enter normal mode by pressing keys of homerow
inoremap jk <Esc>
cnoremap jk <c-c>

" in-line scrolling
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" when jumping always put cursor at center of screen
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" H jump to start-of-line
" L jump to end-of-line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_
onoremap H ^
onoremap L g_

" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" edit general settings
nnoremap <leader>eV :vsplit ~/.vim/config/general.vim<cr>
nnoremap <leader>sV :source ~/.vim/config/general.vim<cr>

" edit keymapping
nnoremap <leader>ek :vsplit ~/.vim/config/keymapping.vim<cr>
nnoremap <leader>sk :source ~/.vim/config/keymapping.vim<cr>

" edit ftplugin for current filetype
nnoremap <leader>ef :execute printf("vsplit ~/.vim/after/ftplugin/%s.vim", &filetype)<cr>
nnoremap <leader>sf :execute printf("source ~/.vim/after/ftplugin/%s.vim", &filetype)<cr>

" edit snippets for current filetype
nnoremap <leader>es :execute printf("vsplit ~/.vim/snippets/%s.snip", &filetype)<cr>
nnoremap <leader>ss :execute printf("source ~/.vim/snippets/%s.snip", &filetype)<cr>

" edit plugins
nnoremap <leader>eP :execute printf("vsplit %s/%s.vim",g:sourcePluginsFilesDir, 'general')<cr>
nnoremap <leader>sP :execute printf("vsplit %s/%s.vim",g:sourcePluginsFilesDir, 'general')<cr>
nnoremap <leader>ep :execute printf("vsplit %s/%s.vim",g:sourcePluginsFilesDir, &filetype)<cr>
nnoremap <leader>sp :execute printf("source %s/%s.vim",g:sourcePluginsFilesDir, &filetype)<cr>

" sudo write
command! W :w !sudo tee %

" use space to toggle folding
nnoremap <Space> za<Space>

" open a gnome-terminal instance in pwd
nnoremap <leader>t :!gnome-terminal &<cr><cr>

