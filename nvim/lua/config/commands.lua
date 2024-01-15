vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("Formatting Commands", { clear = true }),
	pattern = { "*.sparql", "*.rq" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local sparql = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

		local process_sub = string.format('<(echo "%s")', sparql)
		vim.fn.jobstart(string.format("sparql-formatter %s", process_sub), {
			stdout_buffered = true,
			stderr_buffered = true,
			on_stdout = function(_, data, _)
				if table.concat(data) ~= "" and sparql ~= table.concat(data, "\n") then
					vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
					local current_file_path = vim.api.nvim_buf_get_name(0)
					vim.cmd(":w")
					print(string.format("Formatted %s", current_file_path))
				end
			end,
			on_stderr = function(_, data, _)
				if data and table.concat(data) ~= "" then
					print(table.concat(data, "\n"))
					print("Unable to format query")
				end
			end,
		})
	end,
})

vim.cmd([[
  augroup RunCommandOnAstroSave
    autocmd!
    autocmd BufWritePost *.astro call system('npx prettier -w ' . expand('%')) | e
  augroup END
]])
