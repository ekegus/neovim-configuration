local vim = vim

-------------------- GENERAL VIM MAPPINGS -------------------------------
vim.g.mapleader = " "
vim.keymap.set("n", ";", ":", { noremap = true })
-- vim.keymap.set("n", "<leader>ev", ":e $MYVIMRC<CR>", { noremap = true })
-- vim.keymap.set("n", "<Leader>ls", ":buffers<CR>:buffer<Space>", { noremap = true }) -- List buffers and open command menu
-- map("", "Q", "<Nop>", { noremap = false }) -- Disable Ex Mode

-- Nop
vim.keymap.set("n", "%", "<Nop>", { noremap = true })
vim.keymap.set("n", "$", "<Nop>", { noremap = true })
vim.keymap.set("n", "0", "<Nop>", { noremap = true })
vim.keymap.set("n", "^", "<Nop>", { noremap = true })
vim.keymap.set("n", "G", "<Nop>", { noremap = true })

vim.keymap.set("v", "<s-%>", "<Nop>", { noremap = true })
vim.keymap.set("v", "%", "<Nop>", { noremap = true })
vim.keymap.set("v", "$", "<Nop>", { noremap = true })
vim.keymap.set("v", "0", "<Nop>", { noremap = true })
vim.keymap.set("v", "^", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "G", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-6>", "<Nop>", { noremap = true })
vim.keymap.set("i", "<C-c>", "<Nop>", { noremap = true })
vim.keymap.set("v", "<C-c>", "<Nop>", { noremap = true })
vim.keymap.set("v", "<ESC>", "<Nop>", { noremap = true })

-- -------------------------Terminal-----------------------------
-- vim.keymap.set("n", "<Leader>te", ":terminal<CR>", { noremap = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true })
vim.keymap.set("t", "<C-\\><C-n>", "", { noremap = true })
