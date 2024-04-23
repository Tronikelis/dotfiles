local private_ip_addr = ""
local update_private_ip
update_private_ip = function()
	vim.fn.jobstart(
		'ip addr show | grep "192\\.\\|10\\." | head -1 | awk \'{split($0, a, " "); print a[2]}\' | cut -f1 -d"/" | tr -d \'[:blank:]\\n\'',
		{
			stdout_buffered = true,
			detach = false,
			on_stdout = function(chan_id, stdout)
				private_ip_addr = stdout[1]
			end,
			on_exit = function()
				vim.defer_fn(update_private_ip, 10000)
			end,
		}
	)
end
update_private_ip()

local get_private_ip_addr = function()
	return private_ip_addr
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			tabline = {
				lualine_b = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_a = {},
				lualine_c = {},
				lualine_x = { get_private_ip_addr },
				lualine_y = {},
				lualine_z = {
					{
						"datetime",
						style = "%H:%M | %d/%m/%Y",
					},
				},
			},
		})
	end,
}
