local fn = vim.fn

--Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim")    -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim")  -- Useful lua functions used ny lots of plugins
  use("gelguy/wilder.nvim")     -- For when I forget wtf I want to type
  use("is0n/jaq-nvim")          -- Execute code from within vim
  use "rebelot/kanagawa.nvim"
  use "YorickPeterse/happy_hacking.vim"

  -- cmp plugins
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("neovim/nvim-lspconfig") -- LSP itself
  use({
    "williamboman/mason.nvim", -- Makes easier to get lsp servers
    "williamboman/mason-lspconfig.nvim",
  })
  use("jose-elias-alvarez/null-ls.nvim") -- formatting and diagnostics lsp servers
  use({ "olexsmir/gopher.nvim", run = ":GoInstallDeps" })
  use("folke/trouble.nvim")              -- get diag and function references in an easier way

  -- Telescope & Harpoon
  use("nvim-telescope/telescope.nvim")
  use("debugloop/telescope-undo.nvim")
  use("ThePrimeagen/harpoon")

  -- Nvim Tree
  use({ "kyazdani42/nvim-tree.lua", branch = "master" })
  use("nvim-tree/nvim-web-devicons")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("nvim-treesitter/playground")

  -- Doc stuff
  use("terrortylor/nvim-comment")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("vim-pandoc/vim-pandoc")

  -- API stuff
  use("rest-nvim/rest.nvim")

  -- Git stuff
  use("tpope/vim-fugitive")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
