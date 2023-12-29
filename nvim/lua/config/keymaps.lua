local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>l", ":bnext<CR>", opts)
keymap("n", "<leader>h", ":bprevious<CR>", opts)

-- system clipboard integration
keymap("v", "<leader>y", '"+y', opts)
keymap("v", "<leader>Y", '"+Y', opts)

-- NeoTree keymaps
keymap("n", "<leader>ft", ":Neotree filesystem reveal left toggle<CR>", { desc = "toggle file tree" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[F]ind existing [B]uffers" })
vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search git files" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep, { desc = "[L]ive [G]rep" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "dn", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- vim-test keymaps
keymap("n", "<leader>t", ":TestNearest<CR>", opts)
keymap("n", "<leader>T", ":TestFile<CR>", opts)
keymap("n", "<leader>a", ":TestSuite<CR>", opts)
keymap("n", "<leader>L", ":TestLast<CR>", opts)
keymap("n", "<leader>v", ":TestVisit<CR>", opts)

-- json
vim.keymap.set("n", "<leader>jf", "<cmd>%!jq<cr>", { noremap = true, silent = true, desc = "Format with jq" })
vim.keymap.set("n", "<leader>jm", "<cmd>%!jq -c<cr>", { noremap = true, silent = true, desc = "Minify with jq" })

-- Open the current file in the default program (on Mac this should just be just `open`)
-- vim.keymap.set('n', '<leader>x', ':!xdg-open %<cr><cr>')
