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

packer.startup(function()
  use("wbthomason/packer.nvim") -- packer can manage itself

  use("ellisonleao/gruvbox.nvim")
  use("hoob3rt/lualine.nvim")
 	use("akinsho/toggleterm.nvim")
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- lsp, syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("noahgorstein/nvim-lspconfig")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("L3MON4D3/LuaSnip")
  use("jose-elias-alvarez/null-ls.nvim")
  use("MunifTanjim/prettier.nvim")

  	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-github.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

end)
