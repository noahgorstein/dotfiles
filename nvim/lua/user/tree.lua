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
  }
})


require("user.remap").nnoremap("<leader>tv", "<cmd>NvimTreeToggle<CR>")
