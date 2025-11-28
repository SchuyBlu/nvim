-- SETUP FOR DEFAULT KEYS BEHAVIOUR
local glob = vim.g
local keys = vim.keymap

glob.mapleader = " "                -- Maps local leader
glob.maplocalleader = ","           -- Leader for ft specific keymaps

vim.keymap.set("i", "jj", "<ESC>")  -- Remaps escape to jj

-- Helper function to count normal buffers
local function list_number_of_normal_buffers()
	local buffers = vim.api.nvim_list_bufs()
	local count = 0

	for _, id in ipairs(buffers) do
		local buftype = vim.bo[id].buftype
		if buftype == "" then count = count + 1 end
	end
	return count
end

-- Close buffer intelligently
function close_focus_buffer()
	local res = list_number_of_normal_buffers()

	if res == 0 or res == 1 then
		local status, _ = pcall(vim.cmd.wq{ bang = true })
		if not status then
			vim.cmd.q()
		end
		return
	end

	vim.cmd.bd()
end

-- Terminal
keys.set("n", "<F4>", "<cmd>TmuxToggle<CR>", { desc = "Toggle terminal" })

-- Editing
keys.set("n", "<C-BS>", "<cmd>dw<CR>", { desc = "Delete previous word" })

-- NvimTree
keys.set("n", "<leader>fe", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- Buffer management
keys.set("n", "<leader>c", "<cmd>lua close_focus_buffer()<CR>", { desc = "Close buffer" })
keys.set("n", "[", "<cmd>bprev<CR>", { desc = "Previous buffer" })
keys.set("n", "]", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Split/window navigation
keys.set("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left split" })
keys.set("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to bottom split" })
keys.set("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to top split" })
keys.set("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right split" })

-- Split resizing
keys.set("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "Decrease split width" })
keys.set("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "Increase split width" })

-- Terminal mode window navigation
keys.set("t", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left split (terminal)" })
keys.set("t", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right split (terminal)" })

-- Telescope - Files
keys.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
keys.set("n", "<leader>fp", "<cmd>Telescope grep_string<CR>", { desc = "Find path substring" })
keys.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "View buffers" })
keys.set("n", "<leader>fB", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })
keys.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Keymaps" })
keys.set("n", "<leader>fm", "<cmd>Telescope man_pages<CR>", { desc = "Man pages" })
keys.set("n", "<leader>ft", "<cmd>Telescope live_grep<CR>", { desc = "Find text" })
keys.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", { desc = "Go to references" })
keys.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definitions" })
keys.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to implementations" })

-- Git
keys.set("n", "<leader>gB", "<cmd>Telescope git_branches<CR>", { desc = "Git branches" })
keys.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
keys.set("n", "<leader>gl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Lazygit" })

-- LSP
keys.set("n", "<leader>ss", function() vim.lsp.buf.hover() end, { desc = "Show hover documentation" })

-- Claude Code
keys.set("n", "<leader>ac", "<cmd>ClaudeCode<CR>", { desc = "Toggle Claude" })
keys.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<CR>", { desc = "Focus Claude" })
keys.set("v", "<leader>as", "<cmd>ClaudeCodeSend<CR>", { desc = "Send to Claude" })
keys.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<CR>", { desc = "Accept Claude diff" })
keys.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<CR>", { desc = "Deny Claude diff" })
