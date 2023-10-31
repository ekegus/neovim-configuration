local wk = require("which-key")
local vim = vim
local builtin = require("telescope.builtin")

wk.register({
	["<leader>e"] = { vim.cmd.Ex, "Explore" },
	["<leader>v"] = { vim.cmd.Ve, "Vexplore" },
	["<leader>w"] = { vim.cmd.write, "Write" },
	["<leader>x"] = { vim.cmd.close, "Close" },
	["<leader>."] = { vim.cmd.nohlsearch, "Remove search highlights" },

	["<leader>c"] = { ":tabclose<cr>", "Close tab" },
	["<leader>n"] = { ":tabnew<cr>", "New tab" },

	["[t"] = { ":tabprevious<cr>", "Previous tab" },
	["]t"] = { ":tabnext<cr>", "Next tab" },
	["[b"] = { ":bprevious<cr>", "Previous buffer" },
	["]b"] = { ":bnext<cr>", "Next buffer" },

	-- LSP
	["<leader>k"] = {
		function()
			vim.lsp.buf.hover()
		end,
		"Show docs for item under cursor",
	},
	["<leader>a"] = {
		function()
			vim.lsp.buf.code_action()
		end,
		"Perform code action",
	},
	["<leader>r"] = {
		function()
			vim.lsp.buf.rename()
		end,
		"Rename symbol",
	},
	["<leader>h"] = {
		function()
			vim.diagnostic.open_float()
		end,
		"Show diagnostic error in floating window",
	},
	["[d"] = {
		function()
			vim.diagnostic.goto_prev()
		end,
		"Previous error",
	},
	["]d"] = {
		function()
			vim.diagnostic.goto_next()
		end,
		"Next error",
	},
	["<leader>A"] = {
		vim.lsp.buf.add_workspace_folder,
		"Create workspace folder",
	},
	["<leader>R"] = {
		vim.lsp.buf.remove_workspace_folder,
		"Remove workspace folder",
	},
	["gi"] = {
		builtin.lsp_implementations,
		"Goto implementation",
	},
	["gr"] = {
		builtin.lsp_references,
		"Goto references",
	},
	["gy"] = {
		builtin.lsp_type_definitions,
		"Goto type definition",
	},
	["gd"] = {
		builtin.lsp_definitions,
		"Goto definition",
	},
	["<leader>D"] = {
		builtin.diagnostics,
		"Open workspace diagnostics picker",
	},
	["<leader>d"] = {
		function()
			return builtin.diagnostics({ bufnr = 0 })
		end,
		"Open diagnostics picker",
	},
	["<leader>s"] = {
		builtin.lsp_document_symbols,
		"Open symbol picker",
	},
	["<leader>S"] = {
		builtin.lsp_dynamic_workspace_symbols,
		"Open workspace symbol picker",
	},
	["<leader>B"] = {
		builtin.buffers,
		"Open workspace buffer picker",
	},
	["<leader>b"] = {
		builtin.current_buffer_fuzzy_find,
		"Open current buffer picker",
	},
	["<leader>?"] = {
		":Telescope<cr>",
		"Open Telescope",
	},
	["<leader>/"] = {
		builtin.live_grep,
		"Open live grep picker",
	},
	["<leader>f"] = {
		builtin.find_files,
		"Open file picker",
	},
	["<leader>m"] = {
		builtin.git_status,
		"Open modified files picker",
	},
	["<leader>g"] = {
		builtin.git_files,
		"Open git files picker",
	},
	["<leader>j"] = {
		builtin.jumplist,
		"Open jumplist picker",
	},
	["<leader>'"] = {
		builtin.resume,
		"Open previous picker",
	},
})
