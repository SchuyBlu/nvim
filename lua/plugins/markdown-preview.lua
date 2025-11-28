local M = {
	vim.pack.add({
		{ src = "https://github.com/iamcco/markdown-preview.nvim" },
	})
}

function M.config()
	-- Set theme to light mode
	vim.g.mkdp_theme = 'light'

	-- Optional: customize browser and port
	-- vim.g.mkdp_browser = ''  -- leave empty for default browser
	-- vim.g.mkdp_port = ''     -- leave empty for random port

	-- Optional: auto-close preview when switching buffers
	-- vim.g.mkdp_auto_close = 1
end

return M
