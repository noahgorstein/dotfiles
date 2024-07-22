return {
	"akinsho/bufferline.nvim",
	branch = 'main',
	dependencies = "nvim-tree/nvim-web-devicons",
	config = {
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
		},
	},
}
