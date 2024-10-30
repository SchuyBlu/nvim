local status, which_key = pcall(require, "which-key")
local webgl = "npx http-server $PWD -o -p 9999 2>&1 > http.log"
if status then

	local mappings = {
		{ "<localleader>", expr = false, group = "WebGL", nowait = false, remap = false },
		{ "<localleader>s", "<cmd>!" .. webgl .. " &<cr>", desc = "Start WebGL server.", expr = false, nowait = false, remap = false },
		{ "<localleader>k", "<cmd>!killall -u $(whoami) http-server<cr>", desc = "Kill WebGL servers.", expr = false, nowait = false, remap = false}
	}
	which_key.add(mappings)
end

