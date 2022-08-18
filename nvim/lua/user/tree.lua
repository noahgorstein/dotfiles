local ok, tree = pcall(require, "nvim-tree")
if not ok then
	return
end

tree.setup({
	view = {
		side = "left",
	},
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true
  },
})


require("user.remap").nnoremap("<leader>tv", "<cmd>NvimTreeToggle<CR>")
