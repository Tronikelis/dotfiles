return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-frecency.nvim",
	},
	config = function()
		local picker_config = function()
			return {
				show_line = false,
			}
		end

		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					".git/",
				},
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
				path_display = { "truncate" },
			},
			pickers = {
				lsp_references = picker_config(),
				lsp_definitions = picker_config(),
				find_files = {
					hidden = true,
				},
			},
		})

		require("telescope").load_extension("fzf")

		require("telescope").load_extension("frecency")
		vim.keymap.set("n", "<leader><leader>", function()
			require("telescope").extensions.frecency.frecency({
				workspace = "CWD",
			})
		end)

		require("telescope").load_extension("undo")
		vim.keymap.set("n", "<leader>u", require("telescope").extensions.undo.undo)

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
	end,
}
