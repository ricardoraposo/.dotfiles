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
  "norcalli/nvim-colorizer.lua",
  -- "knubie/vim-kitty-navigator",
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
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

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
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        ui = {
          code_action = "",
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons",     -- optional
    },
  },
  { "j-hui/fidget.nvim",                branch = "legacy" },
  { "akinsho/git-conflict.nvim",        version = "*",            config = true },
  { "folke/trouble.nvim" },
  { "nvimtools/none-ls.nvim" },
  { "stevearc/conform.nvim" },
  { "FabijanZulj/blame.nvim" },

  -- Language specific stuff
  { "olexsmir/gopher.nvim",             build = ":GoInstallDeps", lazy = true },
  { "joeveiga/ng.nvim",                 lazy = true },
  { "dmmulroy/ts-error-translator.nvim" },
  { "reasonml-editor/vim-reason-plus" },

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
  { "rose-pine/neovim" },
  { "navarasu/onedark.nvim" },
  { "ramojus/mellifluous.nvim" },
  { "elvessousa/sobrio" },
  { "folke/tokyonight.nvim" },

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
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Doc stuff
  {
    "numToStr/Comment.nvim",
    lazy = true,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
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
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },

  {
    'KadoBOT/nvim-spotify',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    build = 'make'
  },

  -- Git integrations
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  },
}



local opts = {}

require("lazy").setup(plugins, opts)
