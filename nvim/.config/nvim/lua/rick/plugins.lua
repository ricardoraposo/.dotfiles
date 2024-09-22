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
	-- "ojroques/vim-oscyank",
	"mg979/vim-visual-multi",
	"norcalli/nvim-colorizer.lua",
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	{ "neoclide/coc.nvim", branch = "release" },
	{ "akinsho/git-conflict.nvim", version = "*", config = true },

	-- Language specific stuff
	{ "olexsmir/gopher.nvim", build = ":GoInstallDeps", lazy = true },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"debugloop/telescope-undo.nvim",
		},
	},
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({})
		end,
	},

	-- Nvim Tree
	{
		"kyazdani42/nvim-tree.lua",
		branch = "master",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Colorscheme stuff
	{ "ricardoraposo/gruvbox-minor.nvim" },
	{ "sainnhe/sonokai" },

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
	{ "lukas-reineke/virt-column.nvim" },

	-- Doc stuff
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "stevearc/dressing.nvim" },

	-- Backend stuff
	{
		"vhyrro/luarocks.nvim",
		lazy = true,
		priority = 1000,
		config = true,
	},

	-- AI completion stuff
	-- {
	-- 	"Exafunction/codeium.vim",
	-- 	event = "BufEnter",
	-- },

	{
		"KadoBOT/nvim-spotify",
		dependencies = { "nvim-telescope/telescope.nvim" },
		build = "make",
	},

	-- Git integrations
	{ "FabijanZulj/blame.nvim" },
	-- {
	-- 	"pwntester/octo.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup()
	-- 	end,
	-- },
}

local opts = {}

require("lazy").setup(plugins, opts)
