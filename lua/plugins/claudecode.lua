-- Add required package
local M = {
	vim.pack.add({
		{ src = "https://github.com/coder/claudecode.nvim" },
	})
}
function M.config()
	local status, claudecode = pcall(require, "claudecode")
	if not status then
		return
	end

	claudecode.setup({
		-- Terminal configuration
		terminal = {
			split_side = "right",
			split_width_percentage = 0.37,
		},

		-- Auto-start the server
		auto_start = true,

		-- Git repository working directory
		git_repo_cwd = true,
	})
end

return M
