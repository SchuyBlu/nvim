-- Add required packages
local M = {
	vim.pack.add({
		{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	})
}

function M.config()
	local status, blink = pcall(require, "blink.cmp")
	if not status then
		return
	end

	blink.setup({
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				scrollbar = false,
			},
		},
		keymap = {
			preset = "default",
			["<C-space>"] = {},
			["<C-p>"] = {},
			["<Tab>"] = {},
			["<S-Tab>"] = {},
			["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-n>"] = { "select_and_accept" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },
			-- ["<C-e>"] = { "hide" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},

		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			}
		},

		sources = { default = { "lsp" } }
	})
end

return M
