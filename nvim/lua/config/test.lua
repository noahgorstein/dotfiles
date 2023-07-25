vim.g["test#strategy"] = "neovim"
vim.g["test#neovim#term_position"] = "vert"
vim.g["test#python#runner"] = "pytest"
vim.g["test#python#pytest#executable"] = "docker-compose run --rm python-test pytest -rP"
vim.g["test#python#pytest#file_pattern"] = "tests.py"

vim.g["test#go#gotest#executable"] = "go test -v"
-- vim.g["test#enabled_runners"] = {"python#pytest"}

vim.g["test#javascript#jest#executable"] = 'yarn test:unit --no-coverage'

