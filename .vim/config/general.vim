" enable vim features, which are not supported by vi
set nocompatible

" set backspace behavior as we would normally expect
set backspace=indent,eol,start

" set default clipboard as system clipboard
set clipboard=unnamedplus

" enable the use of mouse for [a]ll the mode
set mouse=a

" show a menu of possible completion, when pressing tab in command mode
set wildmenu
set wildmode=full

" highlight the current line
set cursorline

" show line number
set number

" show the line number distance of each line relative to the current one
set relativenumber

" don't wrap even when a line is longer than the width of the window
set nowrap

" show a vertical line at the 80th column
set colorcolumn=80

" don't close buffer when it's abandoned, just leave it hidden
set hidden

set timeoutlen=500

" since there is already lightline which shows the current mode,
" leave space for echodoc
set noshowmode

set scrolloff=99

" completion {{{
" show the completion as complete as possible
set completeopt+=longest

" do not use open a preview window of completion (it's laggy)
set completeopt-=preview

" do not automatically select to first item
set completeopt+=noselect
" }}}

" Search {{{
" highlight searched pattern
set hlsearch

" highlight searched pattern as it's typed
set incsearch
set ignorecase

" when the search pattern contains uppercase chars, then do not ignore case
set smartcase
"}}}

" Indent {{{
set autoindent
set tabstop=4
set shiftwidth=4
set noexpandtab
"}}}

" Colorscheme & Font {{{
set t_Co=256
colorscheme gruvbox
set background=dark

set guifont=DejaVu\ Sans\ Mono\ 12
"}}}

" Folding {{{

" enable folding
set foldenable
set foldmethod=indent
set foldcolumn=1
" when enter in a buffer, no folds are closed
set foldlevelstart=99
set foldnestmax=5
"}}}

" Gui {{{
set guioptions=a
" }}}

" Undo {{{
let s:undo_dir = $HOME . "/.vim/undo"
if !isdirectory(s:undo_dir)
	call system("mkdir " . s:undo_dir)
endif
let &undodir=s:undo_dir
set undofile
" }}}

set list listchars=tab:\▸\ 

" set modeline 
" vim: foldlevel=0 foldmethod=marker
