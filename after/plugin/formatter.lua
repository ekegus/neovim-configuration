-- https://github.com/mhartington/formatter.nvim

local prettier = function()
	return {
		exe = "./node_modules/.bin/prettier",
		args = { "--stdin-filepath", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

local ormolu = function()
	return {
		exe = "ormolu",
		args = { "", vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		-- css = { prettier },
		-- scss = { prettier },
		html = { prettier },
		javascript = { prettier },
		javascriptreact = { prettier },
		typescript = { require("formatter.filetypes.typescript").prettierd },
		typescriptreact = { require("formatter.filetypes.typescript").prettierd },
		-- markdown = { prettier },
		json = { prettier },
		jsonc = { prettier },
		haskell = { ormolu },
		rust = { require("formatter.filetypes.rust").rustfmt() },

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.keymap.set("n", "<leader>F", ":Format<CR>", { silent = true })
vim.keymap.set("n", "<leader>fo", ":Format<CR>", { silent = true })

-- Autocommand for formatting on save
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
