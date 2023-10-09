-- Setup from: https://github.com/VonHeikemen/lsp-zero.nvim/blob
-- /v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero
local vim = vim

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"tsserver",
		"lua_ls",
	},
})

local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "<leader>sd", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>ac", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "<leader>df", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_prev()
	end, opts)

	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_next()
	end, opts)

	vim.keymap.set("n", "<leader>da", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>dr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>dl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, opts)
	vim.keymap.set("n", "<leader>fo", function()
		vim.lsp.buf.format({ async = true })
	end, opts)
end

local lspconfig = require("lspconfig")

local get_servers = require("mason-lspconfig").get_installed_servers

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		on_attach = lsp_attach,
		capabilities = lsp_capabilities,
	})
end

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
