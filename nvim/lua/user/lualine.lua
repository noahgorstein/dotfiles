require('lualine').setup({
	options = {
		theme = "gruvbox",
		component_separators = "",
		section_separators = "",
	},
  sections = {
		lualine_c = {
			{
				"filetype",
				icon_only = true,
			},
			{
				"filename",
				file_status = false,
				path = 1,
			},
		},
	},
})
