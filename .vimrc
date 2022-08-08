" required
" Disable compatibility with vi which can cause unexpected problems.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#@begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" File explorer
Plugin 'scrooloose/nerdtree'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" braces vary in color to make visual matches easier
Plugin 'frazrepo/vim-rainbow'

" Commenter
Plugin 'preservim/nerdcommenter'

" Grep like search
" Plugin 'mileszs/ack.vim'

" Unix shell commands
Plugin 'tpope/vim-eunuch'

" Dim inactive windows
Plugin 'blueyed/vim-diminactive'

" Start up screen
Plugin 'mhinz/vim-startify'

" Autocomplete plugin
Plugin 'Valloric/YouCompleteMe'

" Plugin for Python auto indentation
Plugin 'vim-scripts/indentpython.vim'

" Syntax checking and highlighting
Plugin 'vim-syntastic/syntastic'

" Colorscheme plugins
Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'

Plugin 'tomasiser/vim-code-dark'

" Powerline addon for status bar and keeping track of things like virtualenv, git branch, files edited, etc.
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"required
call vundle#end()
filetype plugin indent on
 
" Enabled plugins and load plugin for the detected file typ
" To ignore plugin indent changes, instead use:
filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :pluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to fresh local cache
" :PluginClean      - confirms removeal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Ensure backspace works as intended
set backspace=indent,eol,start
" Enable type file detection, Vim will be able to try to detect the type of file in use.
filetype on


" set splits for :sp <filename> (vertical split (oppening new file below current file)
set splitbelow
" set splits for :vs <filename> (horizontal split (opening new file to the right of your current file))
set splitright


" Keybinds
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
set clipboard=unnamed

" Turn syntax highlighting on
syntax on

" Remove menu bar
set guioptions -=T

" Add numbers to left hand side
set number

" Highlight cursor line underneath the cursor horizontally
set cursorline

" Set shift width to 3 spaces.
"set shiftwidth=3

" Set tab width to 3 columns.
"set tabstop=3

" Python PEP 8 Indentation
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

" For full stack development you can use another au command for each filetype
" au BufNewFile, BufRead *.js, *.html, *.css
"	\ set tabstop=2
"	\ set softtabstop=2
"	\ set shiftwidth=2	

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
"set nowrap

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

" Appearance mods
" Background style
"set background=dark


" Set colorscheme
"colorscheme slate

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
map <C-X> :call nerdcommenter#Comment("n", "Toggle")<CR>

" Set keybind for NerdTree Toggle
nmap <F6> :NERDTreeToggle<CR>


" VIM YOUCOMPLETE ME (YCM) config --------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make code prettier
let python_highlight_all=1
syntax on


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

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za
