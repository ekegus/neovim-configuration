local vim = vim

require("diffview").setup({})

vim.keymap.set("n", "<Leader>do", ":DiffviewOpen<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>dc", ":DiffviewClose<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>dh", ":DiffviewFileHistory<CR>", { noremap = true })
