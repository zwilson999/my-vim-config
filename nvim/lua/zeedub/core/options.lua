----[[ General user options for neovim ]]----

-- Ensure backspace works as intended
vim.opt.backspace = "indent,eol,start"

-- set splits for :sp <filename> (vertical split (oppening new file below current file)
vim.opt.splitbelow = true

-- set splits for :vs <filename> (horizontal split (opening new file to the right of your current file))
vim.opt.splitright = true

-- Use clipboard for copy/paste
vim.opt.clipboard = "unnamedplus"

-- Add number lines to left hand side
vim.opt.number = true

-- UTF-8 Support
vim.opt.encoding = "utf-8"

-- Use space characters instead of tabs
vim.opt.expandtab = true

-- Do not let cursor scroll below or above N number of lines when scrolling
vim.opt.scrolloff = 0

-- Wrapping
vim.wo.wrap = false
vim.wo.number = true
vim.o.cursorline = true
vim.o.cursorcolumn = false
vim.wo.signcolumn = "yes"

-- Ignore capital letters during search
vim.opt.ignorecase = true

-- Override the ignorecase option if searching for capital letters
-- This allows us to search specifically for capital letters
vim.opt.smartcase = true

-- Show the mode you are in on the last line
vim.opt.showmode = true

-- Show matching words during a search
vim.opt.showmatch = true

-- Make wildmenu behave like similar to Bash autocomplete
vim.opt.wildmode = "list:longest"

-- Set fonts here
vim.opt.guifont = "JetBrainsMono Nerd Font Mono Bold 12"

-- Follow the terminal guicolors if able to be read
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Autocmd to negate auto comments when pressing <CR> to next line
vim.api.nvim_create_autocmd(
        "FileType",
        { command = "set formatoptions-=cro", pattern = "*"}
)

-- NERD COMMENTER Settings
-- Create default comment mappings
vim.g.NERDCreateDefaultMappings = "1"

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = "1"

-- Use compact syntax for prettified multi-line comments
vim.g.NERDCompactSexyComs = "1"

-- Align line-wise comment delims flush left instead of following code indentation
vim.g.NERDDefaultAlign = "left"

-- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDTrimTrailingWhitespace = "1"

-- Addtl gopls config
vim.g.go_gopls_enalbed = "1"
vim.g.go_def_mode = "gopls"
vim.g.go_info_mode = "gopls"

-- Addtl rust config
vim.g.rustfmt_autosave = "1"
vim.g.rustfmt_emit_files = "1"
vim.g.rustfmt_fail_silently = "0"
