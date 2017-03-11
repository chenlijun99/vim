call plug#begin('~/.vim/bundle')

" the directory which contains files responsible of plugin initialization
let g:sourcePluginsFilesDir = expand("$HOME") . "/.vim/config/plugin/"

" source file responsible of plugin initialization (with Plug 'xxx')
function! SourcePlugins(directory, pluginType)
	let sourcePluginsFile = a:directory . "/" . a:pluginType . ".vim"
	if filereadable(sourcePluginsFile)
		execute printf("source %s", sourcePluginsFile)
	else
		echom "Cannot find plugin file " . sourcePluginsFile
	endif
endfunction

call SourcePlugins(sourcePluginsFilesDir, "general")
call SourcePlugins(sourcePluginsFilesDir, "syntax_checkers")
" Language specific plugins {{{
call SourcePlugins(sourcePluginsFilesDir, "cpp")
call SourcePlugins(sourcePluginsFilesDir, "java")
call SourcePlugins(sourcePluginsFilesDir, "web_development")
call SourcePlugins(sourcePluginsFilesDir, "json")
call SourcePlugins(sourcePluginsFilesDir, "dot")
call SourcePlugins(sourcePluginsFilesDir, "R")
call SourcePlugins(sourcePluginsFilesDir, "tex")
call SourcePlugins(sourcePluginsFilesDir, "cmake")
call SourcePlugins(sourcePluginsFilesDir, "vim")
" }}}

call plug#end()

" required by plugin manager (thus to make plugins work)
filetype plugin indent on
" enables syntax highlighting
syntax on

" set modeline 
" vim: foldlevel=0 foldmethod=marker
