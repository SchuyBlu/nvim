-- Add required packages
local M = {
	vim.pack.add({
		{ src = "https://github.com/chrisgrieser/nvim-scissors" }
	})
}

function M.config()
	local status, scissors = pcall(require, "scissors")
	if not status then
		return
	end

	scissors.setup({
		snippetDir = vim.fn.stdpath("config") .. "/snippets",
	})
end

return M
