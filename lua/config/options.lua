local opt = vim.opt

-- File types
vim.cmd [[
  runtime! filetype.vim
  filetype plugin indent on
  syntax enable
]]

-- General 
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.colorcolumn = "80"



