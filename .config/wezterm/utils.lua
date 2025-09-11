local wezterm = require("wezterm")

local M = {}

function M.shell_exists(shell)
	local shells_handle = io.popen("ls /etc/shells")
	if shells_handle == nil then
		return false
	end

	local shells = shells_handle:read("*a")
	wezterm.log_info(shells)
	shells_handle:close()

	return string.find(shells, shell)
end

function M.shell_exists_win(shell)
	local shells_handle = io.popen("where " .. shell)
	if shells_handle == nil then
		return false
	end

	local shells = shells_handle:read("*a")
	wezterm.log_info(shells)
	shells_handle:close()

	if shells == "INFO: Could not find files for the given pattern(s)." then
		return false
	end

	return string.find(shells, shell)
end

return M
