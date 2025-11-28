local M = {
	vim.pack.add({
		{ src = "https://github.com/nvim-lua/plenary.nvim" },
		{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
		{ src = "https://github.com/windwp/nvim-autopairs" },
		{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
		{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
		{ src = "https://github.com/nvim-lualine/lualine.nvim" },
		{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim" },
		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/folke/snacks.nvim" },
	})
}

function M.config()
	local plugins = {
		"nvim-web-devicons",
		"nvim-autopairs",
		"nvim-colorizer",
		"indent-blankline",
		"lualine",
		"rainbow-delimiters",
		"mason",
		"snacks",
	}

	for _, plugin in ipairs(plugins) do
		local status, loaded = pcall(require, plugin)
		if status and loaded.setup then
			loaded.setup({})
		end
	end
end

return M
