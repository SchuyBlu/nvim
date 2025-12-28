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
		hijack_netrw = false,
		hijack_directories = {
			enable = false,
		},
		sort_by = "case_sensitive",
		view = {
			width = 30,
			side = "left",
		},
		renderer = {
			group_empty = true
		},
		filters = {
			dotfiles = false,
			git_ignored = false
		},
	})
end

return M
