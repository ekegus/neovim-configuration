local vim = vim

require("gitsigns").setup({
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
	},

	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		map("n", "<leader>gn", function()
			if vim.wo.diff then
				return "<leader>gn"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "<leader>gp", function()
			if vim.wo.diff then
				return "<leader>gp"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		map("n", "<leader>rh", gs.reset_hunk)
	end,
})
