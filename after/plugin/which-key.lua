local vim = vim
local builtin = require("telescope.builtin")

local wk = require("which-key")

local gs = package.loaded.gitsigns

-- Don't show which key in these modes
-- https://github.com/folke/which-key.nvim/issues/304
require("which-key.plugins.presets").operators["v"] = nil
require("which-key.plugins.presets").operators["y"] = nil
require("which-key.plugins.presets").operators["d"] = nil
require("which-key.plugins.presets").operators["c"] = nil

wk.setup({
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0.75 },
		padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
		winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000, -- positive value to position WhichKey above other floating windows.
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true,
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = " ", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
	},
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		--     -- For example:
		-- ["<space>"] = "SPC",
		--             -- ["<cr>"] = "RET",
		--                 -- ["<tab>"] = "TAB",
	},
	-- triggers_blacklist = {
	-- list of mode / prefixes that should never be hooked by WhichKey
	--     -- this is mostly relevant for keymaps that start with a native binding
	--         i = { "j", "k" },
	-- },
})

wk.register({
	["<leader>w"] = { vim.cmd.write, "Write" },
	["<leader>x"] = { vim.cmd.close, "Close" },
	["<leader>/"] = { vim.cmd.nohlsearch, "Remove search highlights" },
	["<leader>v"] = { vim.cmd.vsplit, "Split window vertically" },
	["<leader>s"] = { vim.cmd.split, "Split window" },

	["[t"] = { ":tabprevious<cr>", "Previous tab" },
	["]t"] = { ":tabnext<cr>", "Next tab" },
	["[b"] = { ":bprevious<cr>", "Previous buffer" },
	["]b"] = { ":bnext<cr>", "Next buffer" },

	["<leader>k"] = {
		function()
			vim.lsp.buf.hover()
		end,
		"Show docs for item under cursor",
	},
	-- LSP
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
		"Open diagnostic error in float",
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
	["<leader>"] = {
		f = {
			name = "Pickers",
			f = { builtin.find_files, "Files" },
			["/"] = { builtin.live_grep, "Live grep" },
			["?"] = { "<cmd>Telescope<cr>", "Telescope" },
			r = { builtin.oldfiles, "Recent files" },
			m = { builtin.git_status, "Modified files" },
			b = { builtin.current_buffer_fuzzy_find, "Current buffer" },
			B = { builtin.buffers, "Workspace buffers" },
			s = { builtin.lsp_document_symbols, "Document symbols" },
			S = { builtin.lsp_dynamic_workspace_symbols, "Workspace symbols" },
			[":"] = { builtin.commands, "Commands" },
			c = { "<cmd>TodoTelescope<cr>", "Todo comments" },
			g = {
				name = "Git",
				b = { builtin.git_bcommits, "Buffer commits" },
				C = { builtin.git_commits, "Workspace commits" },
				f = { builtin.git_files, "Files" },
			},
			d = {
				function()
					return builtin.diagnostics({ bufnr = 0 })
				end,
				"Document diagnostics",
			},
			D = { builtin.diagnostics, "Workspace diagnostics" },
			j = { builtin.jumplist, "Jumplist" },
			["'"] = { builtin.resume, "Previous picker" },
		},
		g = {
			name = "Git",
			r = {
				name = "Reset",
				h = { gs.reset_hunk, "Reset hunk" },
				b = { gs.reset_buffer, "Reset buffer" },
			},
			h = {
				name = "History",
				f = { "<cmd>DiffviewFileHistory %<cr>", "File history" },
				b = { "<cmd>DiffviewFileHistory<cr>", "Branch history" },
			},
			d = { "<cmd>DiffviewOpen<cr>", "Open diff view" },
			x = { "<cmd>DiffviewClose<cr>", "Close diff view" },
			t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle sidebar" },
			f = { "<cmd>DiffviewFocusFiles<cr>", "Focus file panel" },
		},
		t = {
			name = "Tabs",
			x = { "<cmd>tabclose<cr>", "Close Tab" },
			t = { "<cmd>tabnew<cr>", "New tab" },
		},
		b = {
			name = "Buffers",
			d = { "<cmd>bdelete<cr>", "Delete buffer" },
			m = { "<cmd>bmodified<cr>", "Modified buffer" },
			l = { "<cmd>ls<cr>", "Buffer list" },
		},
		n = {
			name = "Netrw",
			e = { "<cmd>Explore<cr>", "Explore" },
			v = { "<cmd>Vexplore<cr>", "Vexplore" },
		},
		l = {
			name = "Trouble List",
			t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
			r = { "<cmd>TroubleToggle lsp_references<cr>", "Symbol references" },
			d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document diagnostics" },
			D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace diagnostics" },
			x = { "<cmd>TroubleClose<cr>", "Close trouble" },
			C = { "<cmd>TodoTrouble<cr>", "Todo comments in workspace" },
			c = { "<cmd>TodoTrouble cwd=.<cr>", "Todo comments in buffer" },
		},
	},
	["mm"] = {
		"<S-%>",
		"Goto matching bracket",
		mode = { "n", "v" },
	},
	["gl"] = {
		"<S-$>",
		"Goto line end",
		mode = { "n", "v" },
	},
	["ygl"] = {
		"y<s-$>",
		"Yank to line end",
	},
	["dgl"] = {
		"d<s-$>",
		"Delete to line end",
	},
	["gh"] = {
		"0",
		"Goto line start",
		mode = { "n", "v" },
	},
	["ygh"] = {
		"y0",
		"Yank to line start",
	},
	["dgh"] = {
		"d0",
		"Delete to line start",
	},
	["gs"] = {
		"<S-^>",
		"Goto first non-blank in line",
		mode = { "n", "v" },
	},
	["ge"] = {
		"G",
		"Goto last line",
		mode = { "n", "v" },
	},
	["ga"] = {
		"<c-6>",
		"Goto last accessed file",
	},
	-- https://learnvimscriptthehardway.stevelosh.com/chapters/15.html
	["jk"] = {
		"<esc>",
		"Cancel / Escape",
		mode = { "v", "i", "c" },
	},
	["in("] = {
		":<c-u>normal! f(vi(<cr>",
		"Change inside next ()",
		mode = { "o" },
	},
	["il("] = {
		":<c-u>normal! F)vi(<cr>",
		"Change inside last ()",
		mode = { "o" },
	},
	["in{"] = {
		":<c-u>normal! f{vi{<cr>",
		"Change inside next {}",
		mode = { "o" },
	},
	["il{"] = {
		":<c-u>normal! F}vi{<cr>",
		"Change inside last {}",
		mode = { "o" },
	},
	["in["] = {
		":<c-u>normal! f[vi[<cr>",
		"Change inside next []",
		mode = { "o" },
	},
	["il["] = {
		":<c-u>normal! F]vi[<cr>",
		"Change inside last []",
		mode = { "o" },
	},
	['in"'] = {
		':<c-u>normal! f"vi"<cr>',
		'Change inside next ""',
		mode = { "o" },
	},
	['il"'] = {
		':<c-u>normal! F"vi"<cr>',
		'Change inside last ""',
		mode = { "o" },
	},
	["<leader>y"] = {
		'"*y',
		"Yank to system clipboard",
		mode = { "v" },
	},
	["]g"] = {
		gs.next_hunk,
		"Next hunk",
	},
	["[g"] = {
		gs.prev_hunk,
		"Previous hunk",
	},
	["]c"] = {
		function()
			require("todo-comments").jump_next()
		end,
		"Next todo comment",
	},
	["[c"] = {
		function()
			require("todo-comments").jump_prev()
		end,
		"Previous todo comment",
	},
})
