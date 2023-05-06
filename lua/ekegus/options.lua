local g = vim.g
local opt = vim.opt -- to set options

-------------------- OPTIONS -------------------------------
opt.termguicolors = true
-- opt.clipboard = "unnamedplus" -- Copy to the system clipboard as the default register
opt.mouse = "a" -- Enable mouse mode
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Ignore case on search
opt.smartcase = true -- Override ignorecase if the search term contains uppercase chars
opt.gdefault = true -- Enable global flag on substitute by default
opt.swapfile = false -- Let's take a chance

-- Enable sign column all the time
-- so the col doesn't jump in/out
-- when diagnostics is on.
opt.signcolumn = "yes"

opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.splitright = true

opt.tabstop = 2 -- Number of spaces for a tab
opt.shiftwidth = 2 -- Number of spaces for indentation
opt.expandtab = true -- User appropriate number of spaces for tab in insert mode
opt.foldenable = false
opt.foldmethod = "indent"
-- Folding: https://github.com/nvim-treesitter/nvim-treesitter#folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Avoid E37 on buffer change
-- https://medium.com/usevim/vim-101-set-hidden-f78800142855
opt.hidden = true

-- Avoid netrw throwing errors when moving files
-- g.netrw_keepdir = 0

-- Open preview in a vertical tab
g.netrw_preview = 1

-- Copy files recursively so that I can easily duplicate folders
-- g.netrw_localcopydircmd = "cp -r"

opt.timeoutlen = 500

opt.splitright = true
opt.diffopt = "vertical"
