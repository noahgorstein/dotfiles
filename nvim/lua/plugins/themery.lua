return {
	'zaldih/themery.nvim',
	priority = 900,
	dependencies = { "kanagawa.nvim", "tokyonight.nvim", "catppuccin/nvim" },
	opts = {
		themes = {
			{
				name = "tokyonight",
				colorscheme = "tokyonight",
				before = [[
				vim.opt.background = "dark"
				]],
			},
			{
				name = 'kanagawa',
				colorscheme = "kanagawa",
				before = [[
				vim.opt.background = "dark"
				]],
			},
			{
				name = 'catppuccin-latte',
				colorscheme = "catppuccin-latte",
				before = [[
				vim.opt.background = "light"
			]]
			},
			{
				name = 'catppuccin-frappe',
				colorscheme = "catppuccin-frappe",
				before = [[
				vim.opt.background = "dark"
			]]
			},
			{
				name = 'catppuccin-macchiato',
				colorscheme = "catppuccin-macchiato",
				before = [[
				vim.opt.background = "dark"
			]]
			},
			{
				name = 'catppuccin-mocha',
				colorscheme = "catppuccin-mocha",
				before = [[
				vim.opt.background = "dark"
				require("lualine").setup({
					options = {
						theme = "catppuccin-mocha",
					},
				})
			]]
			},
		},
		themeConfigFile = "~/.config/nvim/lua/settings/theme.lua",
	},
}
