local opt = vim.opt
opt.guicursor = "n-v-c-sm:block,i-ci-ve:block,r-cr-o:block"   -- Block cursor in all modes
opt.colorcolumn = "80"    -- Highlight column 80
opt.signcolumn = "yes:1"  -- Always show sign column
opt.termguicolors = true  -- Enable true colors
opt.ignorecase = true     -- Ignore case sensitivity in searches
opt.swapfile = false      -- Disable swap files
opt.autoindent = true     -- Enables auto indentation
opt.shiftwidth = 4        -- Number of spaces for auto indent
opt.tabstop = 4           -- Number of spaces for a tab
opt.number = true         -- Lines numbers on
opt.relativenumber = true -- Number lines are relative to current
opt.wrap = false          -- NO SCREEN WRAPPING
opt.cursorline = true     -- Highlights current line
opt.winborder = "rounded" -- Uses rounded borders for windows
opt.hlsearch = false      -- Disable hightling of search results

vim.cmd.filetype("plugin indent on") -- Enable filtype detect, plugins, and indents
