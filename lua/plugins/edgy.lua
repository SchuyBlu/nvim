-- Edgy.nvim configuration for sidebar layouts
local M = {
	vim.pack.add({
		{ src = "https://github.com/folke/edgy.nvim" },
	}),
}

function M.config()
	local function dbui_go_down()
		local current = vim.api.nvim_get_current_win()

		for _, win in ipairs(vim.api.nvim_list_wins()) do
			if win ~= current then
				local buf = vim.api.nvim_win_get_buf(win)
				local ft = vim.bo[buf].filetype
				if ft == "NvimTree" then
					vim.api.nvim_set_current_win(win)
					return
				end
			end
		end
	end

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "dbui",
		callback = function()
			vim.keymap.set("n", "<C-j>", dbui_go_down, {
				buffer = true,
				silent = true,
				desc = "DBUI: jump to NvimTree/down"
			})
		end,
	})

	require("edgy").setup({
		animate = {
			enabled = true,
		},

		left = {
			{
				ft = "dbui",
				title = "Database",
				size = { height = 0.5 },
				pinned = true,
				open = "DBUIToggle",
			},
			{
				ft = "NvimTree",
				title = "Files",
				size = { height = 0.5 },
				pinned = true,
				open = "NvimTreeToggle",
			}
		},
	})
end

return M
