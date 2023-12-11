local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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
  use { "wbthomason/packer.nvim", commit="ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" , commit="55d9fe89e33efd26f532ef20223e5f9430c8b0c0"} -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs" , commit="0f04d78619cce9a5af4f355968040f7d675854a1"} -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim" , commit="0236521ea582747b58869cb72f70ccfa967d2e89"}
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit="1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee" }
  use { "kyazdani42/nvim-web-devicons", commit="8b2e5ef9eb8a717221bd96cb8422686d65a09ed5"}
  use { "kyazdani42/nvim-tree.lua", commit="e8ea62c198f6e91197072350c119e8cc8e7f963a"}
  use { "akinsho/bufferline.nvim" }
  use { "moll/vim-bbye" }
  use { "nvim-lualine/lualine.nvim" }
  use { "akinsho/toggleterm.nvim" }
  use { "ahmedkhalf/project.nvim" }
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim"}
  use {"folke/which-key.nvim"}
  use {"kylechui/nvim-surround"}

	-- Colorschemes
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }

	-- Cmp 
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use { "hrsh7th/cmp-buffer" } -- buffer completions
  use { "hrsh7th/cmp-path" } -- path completions
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-nvim-lua" }

  use { "L3MON4D3/LuaSnip" } --snippet engine
-- Snippetjs
        use{"rafamadriz/friendly-snippets"}

	-- LSP
  use { "neovim/nvim-lspconfig" } -- enable LSP
  use { "williamboman/mason.nvim"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
  use { "RRethy/vim-illuminate" }

	-- Telescope

        use{ "nvim-telescope/telescope.nvim"}
	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
	}

	-- Git
	use { "lewis6991/gitsigns.nvim" }

        use { 'rmagatti/goto-preview'}
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
