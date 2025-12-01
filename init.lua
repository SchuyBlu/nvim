require("configs")
require("keymaps")

local plugins = {
	require("plugins.plugins"),
	require("plugins.rose-pine"),
	require("plugins.tree"),
	require("plugins.toggleterm"),
	require("plugins.scissors"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.blink"),
	require("plugins.claudecode"),
	require("plugins.neoscroll"),
	require("plugins.noice"),
	require("plugins.dadbod"),
	require("plugins.markdown-preview"),
	require("plugins.edgy"),
}

for _, plugin in ipairs(plugins) do
    if plugin.config then
        plugin.config()
    end
end

-- Set up LSP
require("lsp")

-- Auto-open Telescope file browser when starting without arguments
if vim.fn.argc() == 0 then
	vim.defer_fn(function()
		vim.cmd("Telescope file_browser")
	end, 10)
end

-- Finally, set colorscheme
vim.cmd.colorscheme("rose-pine-moon")
