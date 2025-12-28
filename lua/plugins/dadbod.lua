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
end

return M
