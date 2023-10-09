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
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<Leader>te", ":terminal<CR>", { noremap = true })
-- map("n", "<Leader>th", ":split<cr> :terminal<CR>", { noremap = true })
