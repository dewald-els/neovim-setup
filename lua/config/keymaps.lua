local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split window
map("n", "<leader>w", "", { desc = "+Window" }) -- Group Heading
map("n", "<leader>wv", "<C-w>v", {
	noremap = true,
	silent = true,
	desc = "Window - Split Vertical"
})     -- Split window veritcally
map("n", "<leader>wh", "<C-w>s", {
	noremap = true,
	silent = true,
	desc = "Window - Split Horizontal"
})     -- Split window horizontally
map("n", "<leader>we", "<C-w>=", {
	noremap = true,
	silent = true,
	desc = "Window - Make Split Equal",
})     -- Make split equal
map("n", "<leader>wx", ":close<CR>", {
noremap = true,
silent = true,
desc = "Window - Close Split"
}) -- Close current split

-- Buffer navigation
map("n", "<leader>b", "", { desc = "+Buffer" }) -- Group heading
map("n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })     -- Next Buffer
map("n", "<leader>bp", ":bprevious<CR>",  { noremap = true, silent = true, desc = "Prev buffer" }) -- Prev Buffer
map("n", "<leader>bx", ":bdelete<CR>",  { noremap = true, silent = true, desc = "Delete buffer" })   -- Delete current buffer

-- File navigation
map("n", "<leader>f", "", { desc = "+File Navigation" }) --Group heading
map("n", "<leader>fe", ":Explore<CR>",  { noremap = true, silent = true, desc = "Explorer" })  -- Open the File explrorer
map("n", "<leader>fv", ":Vexplore<CR>",  { noremap = true, silent = true, desc = "Explorer (Vertical)" }) -- Open explorer in side

-- FZF File search
map("n", "<leader>s", "", { desc = "+Search" }) --Group heading
map("n", "<leader>sf", ":Files<CR>",  { noremap = true, silent = true, desc = "Search file name" })            -- Search files
map("n", "<leader>sb", ":Buffers<CR>", { noremap = true, silent = true, desc = "Search open buffers" } )          -- Search buffers
map("n", "<leader>so", ":BLines<CR>",  { noremap = true, silent = true, desc = "Search in open file" })           -- Search current file
map("n", "<leader>sa", ":Rg<CR>", { noremap = true, silent = true, desc = "Search text in all files" }) -- Search project with Ripgrep
map("n", "<leader>sh", ":History<CR>",  { noremap = true, silent = true, desc = "Show file history" })          -- Search history

-- Code actions
map("n", "K", vim.lsp.buf.hover, { noremap = true })
map("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true })
map("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
map("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true })
map("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true })
map("n", "gi", vim.lsp.buf.implementation, { noremap = true, silent = true })
map("n", "<C-S-F>", function() vim.lsp.buf.format({ async = true }) end, { noremap = true, silent = true })
