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

call plug#begin()

        " File explorer
        Plug 'scrooloose/nerdtree'

        " Airline
        Plug 'vim-airline/vim-airline'

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

        " For Zig
        Plug 'ziglang/zig.vim'

        " For C#
        " Plug 'OmniSharp/omnisharp-vim'

        " For C
        Plug 'vim-scripts/c.vim'

"Required
call plug#end()

"required
filetype plugin indent on
 
" Ensure backspace works as intended
set backspace=indent,eol,start

" Enable type file detection, Vim will be able to try to detect the type of file in use.
"filetype on

" set splits for :sp <filename> (vertical split (oppening new file below current file)
set splitbelow

" set splits for :vs <filename> (horizontal split (opening new file to the right of your current file))
set splitright

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

" Remove menu bar
set guioptions -=T

" Add numbers to left hand side
set number

" Highlight cursor line underneath the cursor horizontally
set cursorline

" Set shift width to 3 spaces.
"set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Flag unnecessary whitespace
" This will mark extra whitespace bad and probably color it red
au BufRead, BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/

" Show gvim icon
set guioptions+=i

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
" set t_Co=256
" set t_ut=
set background=dark
colorscheme codedark

" Enable auto completion menu after pressing tab
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" NERD COMMENTER --------------------------------------------------------------------------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTrimTrailingWhitespace = 1

" Shortcut to make comment
map <C-c> :call nerdcommenter#Comment("n", "Toggle")<CR>

" Set keybind for NerdTree Toggle
nmap <F6> :NERDTreeToggle<CR>

" Fixedsys-like font
" Download here: https://mega.nz/file/V9JTXKZJ#48OPvvFTR-dRI94AecWBoJAGOSGC-31UnIV2TpV45NU
"set guifont=Fixedsys\ Excelsior\ 3.01-L2\ Mono\ Bold\ 13
"set guifont=Fixedsys\ Excelsior\ 3.01-L2\ Mono\ 13
" set guifont=Fixedsys\ Excelsior\ 16
" set guifont=Source\ Code\ Pro\ 15
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

