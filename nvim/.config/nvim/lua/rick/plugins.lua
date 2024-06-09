vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
	"ricardoraposo/gruvbox-minor.nvim",
	{ "blazkowolf/gruber-darker.nvim", name = "grub" },
	{ "catppuccin/nvim", name = "catppuccin" },
	"github/copilot.vim",

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
	{ "olexsmir/gopher.nvim", build = ":GoInstallDeps", lazy = true },
	{ "joeveiga/ng.nvim", lazy = true },
	{ "j-hui/fidget.nvim", branch = "legacy" },
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
	{ "folke/trouble.nvim" },
	{ "dmmulroy/ts-error-translator.nvim" },
	{ "reasonml-editor/vim-reason-plus" },
	"nvimtools/none-ls.nvim",
	"stevearc/conform.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"debugloop/telescope-undo.nvim",
		},
	},

	-- Nvim Tree
	{
		"kyazdani42/nvim-tree.lua",
		branch = "master",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Colorscheme stuff
	{
		"tjdevries/colorbuddy.nvim",
	},
	{
		"NvChad/base46",
		lazy = true,
		branch = "v2.5",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"vague2k/huez.nvim",
		import = "huez-manager.import",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = true,
		dependencies = {
			{ "windwp/nvim-autopairs", lazy = true },
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
		},
	},

	-- Doc stuff
	{
		"numToStr/Comment.nvim",
		lazy = true,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
	{ "vim-pandoc/vim-pandoc", lazy = true },
	"stevearc/dressing.nvim",

	-- Backend stuff
	{
		"vhyrro/luarocks.nvim",
		lazy = true,
		priority = 1000,
		config = true,
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		lazy = true,
	},
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui" },
	{ "kristijanhusak/vim-dadbod-completion" },
}

local opts = {}

require("lazy").setup(plugins, opts)
