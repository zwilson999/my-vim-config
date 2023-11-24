
" required
" Disable compatibility with vi which can cause unexpected problems.
set nocompatible
" filetype off

" Start Plugins for vim-plug here
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): '~/config/nvim/plugged
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.config/nvim/plugged')

        " creates bar at bottom of editor that shows useful information
        Plug 'nvim-lualine/lualine.nvim'

        " braces vary in color to make visual matches easier
        Plug 'luochen1990/rainbow'

        " Commenter
        Plug 'preservim/nerdcommenter'

        " Unix shell commands can be ran within the vim editor
        Plug 'tpope/vim-eunuch'

        " Start up screen
        Plug 'mhinz/vim-startify'

        " Autocomplete/linter and more
        " Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Install Colorscheme like VS Code's Dark Theme
        " Plug 'tomasiser/vim-code-dark'
        Plug 'Mofiqul/vscode.nvim'

        " Gruvbox themes
        Plug 'morhetz/gruvbox'
        Plug 'sainnhe/gruvbox-material'

        " Shades of purple themes
        Plug 'Rigellute/shades-of-purple.vim'

        " For Rust
        Plug 'rust-lang/rust.vim'
        Plug 'simrat39/rust-tools.nvim'
        Plug 'nvim-lua/plenary.nvim'

        " For Golang
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

        " For C
        Plug 'vim-scripts/c.vim'

        " Nvim file explorer
        Plug 'nvim-tree/nvim-web-devicons'
        Plug 'nvim-tree/nvim-tree.lua'

        " For Java
        Plug 'mfussenegger/nvim-jdtls'

        " Package manager plugin for LSPs
        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'

        " Tabline
        Plug 'lewis6991/gitsigns.nvim'
        Plug 'romgrk/barbar.nvim'

        " For better syntax highlighting
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

        " Nvim's native LSP config system
        Plug 'williamboman/nvim-lsp-installer'
        Plug 'neovim/nvim-lspconfig'

        " Context viewer for functions
        Plug 'nvim-treesitter/nvim-treesitter-context'

call plug#end()

" /************ Plugin Configurations below! ***********/

" turn on file detection
filetype plugin indent on

" Ensure backspace works as intended
set backspace=indent,eol,start

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

" Add numbers to left hand side
set number

" Highlight cursor line underneath the cursor horizontally
set cursorline

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
" set t_ut=
" colorscheme codedark
set termguicolors
set background=dark
colorscheme gruvbox-material
" colorscheme shades_of_purple

" Enable auto completion menu after pressing tab
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" VIM RAINBOW -----------------------------------------------------------------------------
" let g:rainbow_active = 1

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
" let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDTrimTrailingWhitespace = 1

" Shortcut to make comment
map <C-c> :call nerdcommenter#Comment("n", "Toggle")<CR>

" Turn off auto-commenting when pressing enter to next line
autocmd FileType * set formatoptions-=cro

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
" inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
" inoremap {{     {
" inoremap {}     {}
" inoremap (      ()<Left>
" inoremap (<CR>  (<CR>)<Esc>O
" inoremap ((     (
" inoremap ()     ()

" Gopls config
let g:go_gopls_enabled = 1 
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Rust config
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" barbar allow us to select buffer based on entry
" Move to previous/next
nnoremap <silent>    <C-PageUp> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-PageDown> <Cmd>BufferNext<CR>

" Goto specific buffer (ordered left to right in tabline)
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Will open a hover window for the function cursor is over, showing
" documentation for the item
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" Other optional lsp config shortcuts
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"---------------------------LUA config------------------------------------"

" Require our lua config file for any lua configs
lua require('config')

" For loading VsCode Dark+ Theme
" lua require('vscode').load('dark')
