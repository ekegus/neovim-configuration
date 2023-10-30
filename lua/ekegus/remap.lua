local vim = vim

-------------------- GENERAL VIM MAPPINGS -------------------------------
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ve", vim.cmd.Ve)
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "<leader>w", vim.cmd.write, { noremap = true })
vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { noremap = true })
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch, { noremap = true })
vim.keymap.set("n", "<Leader>ls", ":buffers<CR>:buffer<Space>", { noremap = true }) -- List buffers and open command menu
-- map("", "Q", "<Nop>", { noremap = false }) -- Disable Ex Mode

vim.keymap.set("n", "<Leader>cl", ":close<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>vs", ":vsplit<CR>", { noremap = true })

vim.keymap.set("n", "[t", ":tabprevious<CR>", { noremap = true })
vim.keymap.set("n", "]t", ":tabnext<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", { noremap = true })

vim.keymap.set("n", "[b", ":bprevious<CR>", { noremap = true })
vim.keymap.set("n", "]b", ":bnext<CR>", { noremap = true })

-- -------------------------Terminal-----------------------------
vim.keymap.set("n", "<Leader>te", ":terminal<CR>", { noremap = true })

vim.keymap.set("n", "mm", "<S-%>", { noremap = true })
vim.keymap.set("n", "%", "<Nop>", { noremap = true })
vim.keymap.set("n", "<S-%>", "<Nop>", { noremap = true })
vim.keymap.set("i", "jk", "<ESC>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<ESC>", "<Nop>", { noremap = true })
vim.keymap.set("n", "0", "<Nop>", { noremap = true })

vim.keymap.set("n", "gl", "<S-$>", { noremap = true })
vim.keymap.set("n", "$", "<Nop>", { noremap = true })
vim.keymap.set("n", "gh", "0", { noremap = true })
vim.keymap.set("n", "gs", "<S-^>", { noremap = true })
vim.keymap.set("n", "^", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "ge", "G", { noremap = true })
vim.keymap.set("n", "G", "<Nop>", { noremap = true })

vim.keymap.set("n", "ga", "<C-6>", { noremap = true })
vim.keymap.set("n", "<C-6>", "<Nop>", { noremap = true })

vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-\\><C-n>", "", { noremap = true })

-- Change next/prev: Doesn't seem to work properly
-- https://learnvimscriptthehardway.stevelosh.com/chapters/15.html
vim.keymap.set("o", "in(", ":<c-u>normal! f(vi(<cr>", { noremap = true })
vim.keymap.set("o", "il(", ":<c-u>normal! F)vi(<cr>", { noremap = true })

vim.keymap.set("o", "in{", ":<c-u>normal! f{vi{<cr>", { noremap = true })
vim.keymap.set("o", "il{", ":<c-u>normal! F}vi{<cr>", { noremap = true })

vim.keymap.set("o", "in[", ":<c-u>normal! f[vi[<cr>", { noremap = true })
vim.keymap.set("o", "il[", ":<c-u>normal! F]vi[<cr>", { noremap = true })

vim.keymap.set("o", 'in"', ':<c-u>normal! f"vi"<cr>', { noremap = true })
vim.keymap.set("o", 'il"', ':<c-u>normal! F"vi"<cr>', { noremap = true })
