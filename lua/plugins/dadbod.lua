-- Database management with vim-dadbod
local M = {
	vim.pack.add({
		{ src = "https://github.com/tpope/vim-dadbod" },
		{ src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
		{ src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
	})
}

function M.config()
	-- vim-dadbod-ui settings
	vim.g.db_ui_use_nerd_fonts = 1
	vim.g.db_ui_show_database_icon = 1
	vim.g.db_ui_force_echo_notifications = 1
	vim.g.db_ui_win_position = 'left'
	vim.g.db_ui_winwidth = 40

	-- Save queries after execution
	vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui_queries"

	-- Disable folding for dadbod result buffers
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "dbout",
		callback = function()
			vim.opt_local.foldenable = false
		end,
	})

	-- Set up dadbod completion for SQL files with blink.cmp
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "sql", "mysql", "plsql" },
		callback = function()
			local status, blink = pcall(require, "blink.cmp")
			if status then
				blink.setup({
					sources = {
						default = { "dadbod", "buffer" },
						providers = {
							dadbod = {
								name = "Dadbod",
								module = "vim_dadbod_completion.blink",
							},
						},
					},
				})
			end
		end,
	})
end

return M
