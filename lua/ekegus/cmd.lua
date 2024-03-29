local vim = vim
local cmd = vim.cmd

-- Autosave - https://vim.fandom.com/wiki/Auto_save_files_when_focus_is_lost
-- cmd([[
--   augroup AutoSave
--     autocmd!
--     :au FocusLost * :wa
--     :au BufLeave * :wa
--   augroup end
-- ]])

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- Make :find useful
-- cmd("set path+=$PWD/src/**")
-- cmd("set path+=$PWD/test/**")

-------------------- TERMINAL ---------------------------
-- always start in insert mode
vim.cmd("autocmd TermOpen * startinsert")
-- disable line numbers
vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
-- suppress process exited message
vim.cmd("autocmd TermClose term://*lazygit execute 'bdelete! ' . expand('<abuf>')")

