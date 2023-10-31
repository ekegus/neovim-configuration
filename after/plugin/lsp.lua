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

local lspconfig = require("lspconfig")

local get_servers = require("mason-lspconfig").get_installed_servers

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server_name in ipairs(get_servers()) do
	lspconfig[server_name].setup({
		capabilities = lsp_capabilities,
	})
end

local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
