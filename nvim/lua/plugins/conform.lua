return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" }, "eslint_d" },
			typescript = { { "prettierd", "prettier" }, "eslint_d" },
			astro = { "prettierd" },
		},
		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_fallback = true,
			timeout_ms = 1500,
		},
	},
}
