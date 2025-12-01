-- Add required packages
local M = { 
	vim.pack.add({
		{ src = "https://github.com/nvim-tree/nvim-tree.lua" }
	})
}

function M.config()
	local status, nvim_tree = pcall(require, "nvim-tree")
	if not status then
		return
	end
	nvim_tree.setup({
		sort_by = "case_sensitive",
		view = {
			width = 30
		},
		renderer = {
			group_empty = true
		},
		filters = {
			dotfiles = true
		},
	})
end

return M
