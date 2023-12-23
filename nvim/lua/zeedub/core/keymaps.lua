vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- Split navigations
-- Move to the split  below
map("n", "<C-J>", "<C-W><C-J>", { noremap = true, silent = false })

-- Move to the split above
map("n", "<C-K>", "<C-W><C-K>", { noremap = true, silent = false })

-- Move to the right split
map("n", "<C-L>", "<C-W><C-L>", { noremap = true, silent = false })

-- Move to the left split
map("n", "<C-H>", "<C-W><C-H>", { noremap = true, silent = false })

-- Nerd Commenter comment keybind
map("n", "<C-c>", ':call nerdcommenter#Comment("n", "toggle")<CR>', { noremap = true, silent = true })

-- Insert closing braces after typing first
map("i", "{<CR>", "{<CR>}", { noremap = true, silent = false})

-- Insert closing parens after typing first
map("i", "(<CR>", "(<CR>)", { noremap = true, silent = false})

-- Barbar allows us to select buffer based on entry
-- Move to prev/next
map("n", "<C-PageUp>", "<Cmd>BufferPrevious<CR>", { silent = true })
map("n", "<C-PageDown>", "<Cmd>BufferNext<CR>", { silent = true })

-- Navigate to specific buffer
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { silent = true })
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { silent = true })
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { silent = true })
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { silent = true })
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { silent = true })
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { silent = true })
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { silent = true })
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { silent = true })
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { silent = true })
map("n", "<A-0>", "<Cmd>BufferLast<CR>", { silent = true })

-- Will open a hover window for the function our cursor is over
-- This will show documentation for the function
map("n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", { silent = true })
