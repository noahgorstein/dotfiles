return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "kanagawa",
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				}
			}
		})
	end,
}
