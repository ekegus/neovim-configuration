local telescope = require("telescope")
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
			layout_config = {
				width = function(_, max_columns, _)
					return math.min(max_columns, 120)
				end,
			},
		},
		live_grep = {
			theme = "dropdown",
			layout_config = {
				width = function(_, max_columns, _)
					return math.min(max_columns, 120)
				end,
			},
		},
		git_status = {
			theme = "dropdown",
			layout_config = {
				width = function(_, max_columns, _)
					return math.min(max_columns, 120)
				end,
			},
		},
		diagnostics = {
			theme = "dropdown",
			layout_config = {
				width = function(_, max_columns, _)
					return math.min(max_columns, 120)
				end,
			},
		},
		lsp_document_symbols = {
			theme = "dropdown",
			layout_config = {
				width = function(_, max_columns, _)
					return math.min(max_columns, 120)
				end,
			},
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
