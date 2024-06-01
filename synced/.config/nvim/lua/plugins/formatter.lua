return {
	"stevearc/conform.nvim",
	config = function()
		local prettier = {
			{ "prettierd", "prettier" },
		}

		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = prettier,
				typescript = prettier,
				typescriptreact = prettier,
				tsx = prettier,
				html = prettier,
				json = prettier,
				markdown = prettier,
				sh = { "shfmt" },
				zsh = { "shfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
			},
		})
	end,
}
