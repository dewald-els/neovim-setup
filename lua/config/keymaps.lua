local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split window
map("n", "<leader>sv", "<C-w>v", opts) -- Split window veritcally
map("n", "<leader>sh", "<C-w>s", opts) -- Split window horizontally
map("n", "<leader>se", "<C-w>=", opts) -- Make split equal
map("n", "<leader>sx", ":close<CR>", opts) -- Close current split

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", opts) -- Next Buffer
map("n", "<leader>bp", ":bprevious<CR>", opts) -- Prev Buffer
map("n", "<leader>bx", ":bdelete<CR>", opts) -- Delete current buffer

-- File navigation
map("n", "<leader>fe", ":Explore<CR>", opts) -- Open the File explrorer 
map("n", "<leader>fv", ":Vexplore<CR>", opts) -- Open explorer in side

-- FZF File search 
map("n", "<leader>sf", ":Files<CR>", opts) -- Search files
map("n", "<leader>sb", ":Buffers<CR>", opts) -- Search buffers
map("n", "<leader>so", ":BLines<CR>", opts) -- Search current file
map("n", "<leader>sa", ":Rg ", { noremap = true }) -- Search project with Ripgrep
map("n", "<leader>sh", ":History<CR>", opts) -- Search history

-- Code actions
map("n", "K", vim.lsp.buf.hover, { noremap = true })
map("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true })
