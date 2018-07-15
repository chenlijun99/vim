call plug#begin('~/.vim/bundle')

let s:pluginFilesDir = expand('<sfile>:p:h') . '/plugin/'
execute 'source' . s:pluginFilesDir . '/general.vim'
execute 'source' . s:pluginFilesDir . '/language_services.vim'
execute 'source' . s:pluginFilesDir . '/debug.vim'

" source language specific plugin inclusion files
let s:languageSpecificPluginFilesDir = s:pluginFilesDir . '/language_specific/'
let pluginFiles = split(globpath(s:languageSpecificPluginFilesDir, '*.vim'), '\n')
for pluginFile in pluginFiles
	execute 'source' pluginFile
endfor
call plug#end()

" required by plugin manager
filetype plugin indent on
" enables syntax highlighting
syntax on

" set modeline 
" vim: foldlevel=0 foldmethod=marker
