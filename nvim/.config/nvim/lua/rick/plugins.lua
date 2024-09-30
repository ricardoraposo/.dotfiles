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
  { "mg979/vim-visual-multi" },
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
    },
  },

  { "neoclide/coc.nvim",               branch = "release" },

  -- Language specific stuff
  { "olexsmir/gopher.nvim",            build = ":GoInstallDeps", lazy = true },
  { "reasonml-editor/vim-reason-plus", event = "VeryLazy" },

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
  { 'ferdinandrau/lavish.nvim',  priority = 1000 },

  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("colorizer").setup()
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    dependencies = {
      { "windwp/nvim-autopairs", lazy = true },
      "nvim-treesitter/playground",
      {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
      },
    },
  },

  -- Doc stuff
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = true,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        select = {
          backend = { "fzf", "builtin", "nui" },
        },
      })
    end
  },

  -- Git integrations
  { "akinsho/git-conflict.nvim", version = "*",  config = true },
  {
    "FabijanZulj/blame.nvim",
    lazy = true,
    config = function()
      require("blame").setup()
    end
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
