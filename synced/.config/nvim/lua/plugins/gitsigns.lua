return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,

			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local opts = { buffer = bufnr }

				vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, opts)
				vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, opts)

				vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, opts)
				vim.keymap.set("n", "<leader>hB", function()
					gitsigns.blame_line({ full = true })
				end, opts)

				vim.keymap.set("n", "[h", function()
					gitsigns.nav_hunk("prev")
				end, opts)

				vim.keymap.set("n", "]h", function()
					gitsigns.nav_hunk("next")
				end, opts)
			end,
		})
	end,
}
