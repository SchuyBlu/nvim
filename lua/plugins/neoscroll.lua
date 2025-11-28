local M = {
	vim.pack.add({
		{ src = "https://github.com/karb94/neoscroll.nvim" },
	})
}

function M.config()
	require('neoscroll').setup({
		hide_cursor = true,
		stop_eof = true,
		respect_scrolloff = false,
		cursor_scrolls_alone = true,
		easing_function = nil,
		performance_mode = false,
	})

	local neoscroll = require('neoscroll')

	-- Custom scroll durations (in milliseconds) - lower = faster
	local keymap = {
		['<C-u>'] = function() neoscroll.scroll(-vim.wo.scroll, {move_cursor=true, duration=100}) end,
		['<C-d>'] = function() neoscroll.scroll(vim.wo.scroll, {move_cursor=true, duration=100}) end,
		['<C-b>'] = function() neoscroll.scroll(-vim.api.nvim_win_get_height(0), {move_cursor=true, duration=150}) end,
		['<C-f>'] = function() neoscroll.scroll(vim.api.nvim_win_get_height(0), {move_cursor=true, duration=150}) end,
	}

	local modes = { 'n', 'v', 'x' }
	for key, func in pairs(keymap) do
		vim.keymap.set(modes, key, func)
	end
end

return M
