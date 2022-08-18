local options = {
	clipboard = "unnamedplus",
	hidden = true,
	updatetime = 300, -- faster update times
	mouse = "a",
	wrap = false,
	textwidth = 0,
	expandtab = true,
	smartindent = true,
	shiftwidth = 2,
	softtabstop = 2,
	tabstop = 2,
	scrolloff = 10,
	number = true,
	relativenumber = true,
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	backspace = { "indent", "eol", "start" },
	spell = true,
  spelllang = { "en_us" },
  splitright = true,
  cursorline = true,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

