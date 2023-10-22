
" required
" Disable compatibility with vi which can cause unexpected problems.
set nocompatible
filetype off

" Start Plugins for vim-plug here
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.config/nvim/plugged')

" File explorer
"Plug 'scrooloose/nerdtree'

" Airline
Plug 'vim-airline/vim-airline'

" braces vary in color to make visual matches easier
Plug 'frazrepo/vim-rainbow'

" Commenter
Plug 'preservim/nerdcommenter'

" Unix shell commands
Plug 'tpope/vim-eunuch'

" Start up screen
Plug 'mhinz/vim-startify'

" Autocomplete/linter and more
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Install Colorscheme like VS Code's Dark Theme
Plug 'tomasiser/vim-code-dark'

" For Rust
Plug 'rust-lang/rust.vim'

" For Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" For C
Plug 'vim-scripts/c.vim'

" Nvim file explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Tabline
Plug 'lewis6991/gitsigns.nvim'
Plug 'romgrk/barbar.nvim'

"required
call plug#end()
filetype plugin indent on
" Put your non-Plugin stuff after this line

" Ensure backspace works as intended
set backspace=indent,eol,start

" set splits for :sp <filename> (vertical split (oppening new file below current file)
set splitbelow
" set splits for :vs <filename> (horizontal split (opening new file to the right of your current file))
set splitright

" Keybinds (changes semicolon to colon for writing Vim commands easier)
nnoremap ; :

"split navigations
" Move to the split below
nnoremap <C-J> <C-W><C-J>

" Move to the split above 
nnoremap <C-K> <C-W><C-K>

" Move to the split to the right
nnoremap <C-L> <C-W><C-L>

" Move to the split to the left
nnoremap <C-H> <C-W><C-H>

" Use clipboard for copy/paste
set clipboard=unnamedplus

" Turn syntax highlighting on
syntax on

" Add numbers to left hand side
set number

" Highlight cursor line underneath the cursor horizontally
set cursorline

" Flag unnecessary whitespace
" This will mark extra whitespace bad and probably color it red
au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

" UTF-8 Support
set encoding=utf-8

" Use space characters instead of tabs
set expandtab

" Do not save backup files
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=0

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching through a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=100

" Set colorscheme
set t_Co=256
set t_ut=
colorscheme codedark

" Enable auto completion menu after pressing tab
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Therea re certain files that we would never want to edit with Vim
" Wildmenu will ignore files with these extensions.
"set wildignore=*.docx, *.jpg, *.png, *.gif, *.pdf, *.pyc, *.exe, *.flv, *.img, *.xlsx

" VIM RAINBOW -----------------------------------------------------------------------------
let g:rainbow_active = 1

" NERD COMMENTER --------------------------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Add your own custom formats or override defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**', 'right': '*.' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTrimTrailingWhitespace = 1

" Shortcut to make comment
map <C-c> :call nerdcommenter#Comment("n", "Toggle")<CR>

" Set font to Source Code Pro
"set guifont=Source\ Code\ Pro\ 15
set guifont=JetBrainsMono\ Nerd\ Font\ Mono\ Regular\ 13

" Read ~/.NERDTreeBooksmarks file and takes its second column
function! s:nerdtreeBookmarks()
	let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
	let bookmarks = bookmarks[0:-2] " Slices an empty last line
	return map(bookmarks, "{'line': v:val, 'path': v:val}" )
endfunction

"VIM STARTIFY-----------------------------------------------------------------------------
let g:startify_lists = [
	\ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
	\]

" Insert closing brace after typing first
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

" Gopls config
let g:go_gopls_enabled = 0

" Setup Config for nvim tree
lua require'nvim-tree'.setup {}
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 1,
"    \ 'files': 1,
"    \ 'folder_arrows': 1,
"    \ }
