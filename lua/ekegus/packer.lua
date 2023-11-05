local vim = vim

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	-- use("shaunsingh/nord.nvim")
	-- use("folke/tokyonight.nvim")
	-- use("EdenEast/nightfox.nvim")
	-- use("marko-cerovac/material.nvim")

	-- use("olivercederborg/poimandres.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
	})

	use({
		"tpope/vim-commentary",
	})

	use({ "mhartington/formatter.nvim" })

	use({ "mfussenegger/nvim-lint" })

	use({ "lewis6991/gitsigns.nvim" })

	use({
		"folke/which-key.nvim",
	})

	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- use({ "github/copilot.vim" })

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	-- use({
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		require("leap").setup({})
	-- 	end,
	-- })

	-- use({ "folke/noice.nvim", requires = "MunifTanjim/nui.nvim" })
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	-- })
	-- use({
	-- 	"folke/zen-mode.nvim",
	-- 	opts = {},
	-- })

	-- use({
	-- 	"folke/twilight.nvim",
	-- 	opts = {},
	-- })

	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim", opts = {} },
	})

	-- Automatically switch between light and dark themes
	use({ "cormacrelf/dark-notify" })

	-- use({ "echasnovski/mini.pairs", branch = "stable" })

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- use({
	-- "nvim-neorg/neorg",
	-- config = function()
	-- 	require("neorg").setup({
	-- 		load = {
	-- 			["core.defaults"] = {}, -- Loads default behaviour
	-- 			["core.concealer"] = {}, -- Adds pretty icons to your documents
	-- 			["core.dirman"] = { -- Manages Neorg workspaces
	-- 				config = {
	-- 					workspaces = {
	-- 						work = "~/notes/work",
	-- 						home = "~/notes/home",
	-- 					},
	-- 				},
	-- 			},
	-- 		},
	-- 	})
	-- end,
	-- run = ":Neorg sync-parsers",
	-- requires = "nvim-lua/plenary.nvim",
	-- })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
