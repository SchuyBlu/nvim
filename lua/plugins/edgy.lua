-- Edgy.nvim configuration for sidebar layouts
local M = {
	vim.pack.add({
		{ src = "https://github.com/folke/edgy.nvim" },
	}),
}

function M.config()
	require("edgy").setup({
		animate = {
			enabled = true,
		},

		left = {
			{
				ft = "dbui",
				title = "Database",
				size = { height = 0.5 },
				pinned = false,
			},
			{
				ft = "NvimTree",
				title = "Files",
				size = { height = 0.5 },
				pinned = true,
			}
		},
	})
end

return M
