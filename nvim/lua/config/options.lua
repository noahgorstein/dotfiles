local options = {
	background = 'dark',
	clipboard = 'unnamedplus',
	completeopt = { 'menu', 'menuone', 'noselect' },
	cursorline = true,
	hidden = true,
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	mouse = 'a',
	number = true,
	relativenumber = false,
	scrolloff = 10,
	shiftwidth = 2,
	sidescrolloff = 10,
	signcolumn = 'yes',
	softtabstop = 4,
	splitbelow = true,
	splitright = true,
	swapfile = true,
	tabstop = 4,
	termguicolors = true,
	timeout = true,
	timeoutlen = 300,
	updatetime = 250,
	wrap = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
