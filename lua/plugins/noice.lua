local M = {
	vim.pack.add({
		{ src = "https://github.com/MunifTanjim/nui.nvim" },
		{ src = "https://github.com/folke/noice.nvim" },
	})
}

function M.config()
	local status, noice = pcall(require, "noice")
	if not status then
		return
	end

	noice.setup({
		cmdline = {
			enabled = true,
			view = "cmdline_popup", -- Use popup instead of bottom cmdline
		},

		-- Customize the cmdline popup position
		views = {
			cmdline_popup = {
				position = {
					row = "95%",
					col = "6%",
				},
				size = {
					width = 60,  -- Adjust width as needed
					height = "auto",
				},
			},
		},

		-- Disable noice signature help and hover to let LSP handle it
		lsp = {
			signature = {
				enabled = false,
			},
			hover = {
				enabled = false,
			},
		},
	})
end

return M
