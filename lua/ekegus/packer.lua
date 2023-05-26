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
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use("shaunsingh/nord.nvim")

	use("olivercederborg/poimandres.nvim")

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

	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use({ "github/copilot.vim" })

	use({ "mbbill/undotree" })

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").setup({})
		end,
	})

	use({ "echasnovski/mini.pairs", branch = "stable" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
