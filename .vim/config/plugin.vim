call plug#begin('~/.vim/bundle')

" directory which contains files responsible of plugin inclusion and setup
"let g:sourcePluginsFilesDir = expand("$HOME") . "/.vim/config/plugin/"
let g:pluginFilesDir = expand("$HOME") . "/.vim/config/plugin/"

let pluginFiles = split(globpath(pluginFilesDir, "*.vim"), '\n')
for pluginFile in pluginFiles
	execute printf("source %s", pluginFile)
endfor
call plug#end()

" required by plugin manager (thus to make plugins work)
filetype plugin indent on
" enables syntax highlighting
syntax on

" set modeline 
" vim: foldlevel=0 foldmethod=marker
