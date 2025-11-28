-- Add required packages
local M = {
	vim.pack.add({
		{ src = "https://github.com/nvim-treesitter/nvim-treesitter" }
	})
}

function M.config()
	local status, treesitter = pcall(require, "nvim-treesitter.configs")
	if not status then
		return
	end

	treesitter.setup({
		ensure_installed = {
			"c",
			"cpp",
			"c_sharp",
			"rust",
			"lua",
			"python",
			"javascript",
			"perl",
			"bash",
			"css",
			"html",
			"vim",
			"json",
			"markdown",
			"markdown_inline",
			"dockerfile",
		},
		sync_install = true,
		auto_install = true,
		highlight = { enable = true },
	})
end

return M
