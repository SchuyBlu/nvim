-- Add required packages
local M = {
	vim.pack.add({
		{ src = "https://github.com/rose-pine/neovim" },
	})
}

function M.config()
	local status, rose_pine = pcall(require, "rose-pine")
	if not status then
		return
	end

	rose_pine.setup({
		variant = "auto", -- auto, main, moon, or dawn
		styles = {
			bold = true,
			italic = false, -- Disable italics
			transparency = false,
		},
	})
end

return M
