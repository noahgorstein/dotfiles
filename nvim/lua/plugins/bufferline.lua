return {
	"akinsho/bufferline.nvim",
	version = "v3.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_update_in_insert = true,
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
