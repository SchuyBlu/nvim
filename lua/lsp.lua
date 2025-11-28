-- Ensure Mason servers are installed
local mason_registry = require("mason-registry")
local lsp_to_mason = {
	bash_ls = "bash-language-server",
	lua_ls = "lua-language-server",
	ts_ls = "typescript-language-server",
	rust_analyzer = "rust-analyzer",
	pyright = "pyright",
	clangd = "clangd",
}

-- Auto-install missing servers
for _, mason_name in pairs(lsp_to_mason) do
	local package = mason_registry.get_package(mason_name)
	if not package:is_installed() then
		vim.notify("Installing " .. mason_name, vim.log.levels.INFO)
		package:install()
	end
end

-- Load and register LSP configs
local lsp_servers = {
	"bash_ls",
	"lua_ls",
	"ts_ls",
	"rust_analyzer",
	"pyright",
	"clangd",
}

for _, server in ipairs(lsp_servers) do
	local config = require("lsp." .. server)
	vim.lsp.config(server, config)
end

-- Enable all registered LSPs
vim.lsp.enable(lsp_servers)

vim.diagnostic.config({ virtual_text = true })
