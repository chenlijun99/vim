" enable vim features, which are not supported by vi
set nocompatible

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

" show the completion as complete as possible
set completeopt+=longest

" do not use open a preview window of completion (it's laggy)
set completeopt-=preview

" don't close buffer when it's abandoned, just leave it hidden
set hidden

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
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=1
set foldnestmax=1
"}}}

set list listchars=tab:\▸\ 

" set modeline 
" vim: foldlevel=0 foldmethod=marker