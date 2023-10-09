local vim = vim

vim.cmd.colorscheme("rose-pine")

local create_cmd = vim.api.nvim_create_user_command

-- https://gist.github.com/Schniz/5cfc225920486ffa2fb447545b9f6d24#file-toggle-vim
create_cmd("ToggleBackground", function()
	if vim.o.background == "dark" then
		vim.cmd("set bg=light")
	else
		vim.cmd("set bg=dark")
	end
end, {})

vim.keymap.set("n", "<Leader>tb", ":ToggleBackground<CR>", { noremap = true })
