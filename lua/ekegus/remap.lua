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

-- map("n", "<Leader>tn", ":tabnext<CR>", { noremap = true })
-- map("n", "<Leader>tp", ":tabprevious<CR>", { noremap = true })
-- map("n", "<Leader>tc", ":tabclose<CR>", { noremap = true })
-- map("n", "<Leader>tc", ":tabnew<CR>", { noremap = true })

-- map("n", "<Leader>bn", ":bnext<CR>", { noremap = true })
-- map("n", "<Leader>bp", ":bprevious<CR>", { noremap = true })
-- map("n", "<Leader>bc", ":bclose<CR>", { noremap = true })
-- map("n", "<Leader>bd", ":bdelete<CR>", { noremap = true })
-- map("n", "<Leader>bw", ":bwipeout<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>cl", ":close<CR>", { noremap = true })

-- Move this
-- map("n", "<Leader>do", ":DiffviewOpen<CR>", { noremap = true })
-- map("n", "<Leader>dc", ":DiffviewClose<CR>", { noremap = true })
-- map("n", "<Leader>dh", ":DiffviewFileHistory<CR>", { noremap = true })

vim.keymap.set("n", "<Leader>vs", ":vsplit<CR>", { noremap = true })

-- -------------------------Terminal-----------------------------
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<Leader>te", ":terminal<CR>", { noremap = true })
-- map("n", "<Leader>th", ":split<cr> :terminal<CR>", { noremap = true })

-- -- Delete/close buffer, but keep split open
-- map("n", ",d", ":b#<bar>bd#<CR>", { noremap = true, silent = true })
-- map("n", ",c", ":b#<bar>close#<CR>", { noremap = true, silent = true })
