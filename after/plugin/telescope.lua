local vim = vim
local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble, ["jk"] = actions.close },
			n = { ["<c-t>"] = trouble.open_with_trouble, ["jk"] = actions.close },
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		git_status = {
			theme = "dropdown",
		},
		diagnostics = {
			theme = "dropdown",
		},
		lsp_document_symbols = {
			theme = "dropdown",
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

-- https://github.com/nvim-telescope/telescope-ui-select.nvim
require("telescope").load_extension("ui-select")

-- local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader><leader>", ":Telescope<CR>", {})
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- File Pickers
vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>gf", builtin.git_files, {})

-- -- Vim Pickers
vim.keymap.set("n", "<leader>bu", builtin.buffers, {})
vim.keymap.set("n", "<leader>cb", builtin.current_buffer_fuzzy_find, {})

-- -- LSP Pickers
vim.keymap.set("n", "gr", builtin.lsp_references, {})
-- vim.keymap.set("n", "<leader>di", builtin.diagnostics, {})
vim.keymap.set("n", "<leader>di", function()
	return builtin.diagnostics({ bufnr = 0 })
end, {})
vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set("n", "gi", builtin.lsp_implementations, {})

vim.keymap.set("n", "gy", builtin.lsp_type_definitions, {})
vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
vim.keymap.set("n", "<leader>gD", function()
	return builtin.lsp_definitions({ jump_type = "vsplit" })
end, {})

-- -- Git Pickers
vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
