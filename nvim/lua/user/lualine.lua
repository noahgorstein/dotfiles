require('lualine').setup({
	options = {
		theme = "tokyonight",
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
