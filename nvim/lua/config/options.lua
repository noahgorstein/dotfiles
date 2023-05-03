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
	shiftwidth = 4,
	sidescrolloff = 10,
	signcolumn = 'yes',
	softtabstop = 0,
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

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

augroup('setIndent', { clear = true })
autocmd('Filetype', {
	group = 'setIndent',
	pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
		'yaml', 'lua', 'typescriptreact',
	},
	command = 'setlocal shiftwidth=2 tabstop=2'
})
autocmd('Filetype', {
	group = 'setIndent',
	pattern = { 'python', 'go' },
	command = 'setlocal shiftwidth=4 tabstop=4'
})
