vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vert"
vim.g["test#python#runner"] = "pytest"
vim.g["test#python#pytest#executable"] = "docker-compose run --rm python-test pytest -rP"
vim.g["test#python#pytest#file_pattern"] = "tests.py"

vim.g["test#go#gotest#executable"] = "go test -v"
-- vim.g["test#enabled_runners"] = {"python#pytest"}

vim.g["test#javascript#jest#executable"] = 'yarn test:unit --no-coverage'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>t", ":TestNearest<CR>", opts)
keymap("n", "<leader>T", ":TestFile<CR>", opts)
keymap("n", "<leader>a", ":TestSuite<CR>", opts)
keymap("n", "<leader>L", ":TestLast<CR>", opts)
keymap("n", "<leader>g", ":TestVisit<CR>", opts)
