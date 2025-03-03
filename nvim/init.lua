vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	-- dev = {
	-- 	path = "~/projects",
	-- 	patterns = { "nvim-lspconfig" },
	-- },
})

require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.test")
require("config.commands")
require("config.filetype")
