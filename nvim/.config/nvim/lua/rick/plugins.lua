local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"gelguy/wilder.nvim",
	"ojroques/vim-oscyank",
	"mg979/vim-visual-multi",
	"alexghergh/nvim-tmux-navigation",
	"norcalli/nvim-colorizer.lua",
	"ellisonleao/gruvbox.nvim",
	"ricardoraposo/gruvbox-minor.nvim",

	-- cmp plugins
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
		},
	},

	-- snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{ "olexsmir/gopher.nvim", build = ":GoInstallDeps" },
	"folke/trouble.nvim",
	"nvimtools/none-ls.nvim",
	"stevearc/conform.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"debugloop/telescope-undo.nvim",
		},
	},

	-- Harpoon yaaaaa
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
	},

	-- Nvim Tree
	{
		"kyazdani42/nvim-tree.lua",
		branch = "master",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-autopairs",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
		},
	},

	-- Doc stuff
	"terrortylor/nvim-comment",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"vim-pandoc/vim-pandoc",
	"stevearc/dressing.nvim",

	-- Backend stuff
	"rest-nvim/rest.nvim",
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",
}

local opts = {}

require("lazy").setup(plugins, opts)
