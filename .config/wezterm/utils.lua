local wezterm = require("wezterm")

-- forward declarations for private functions
local shell_exists_win, shell_exists_linux, generic_shell_finder

---@class Utils
local M = {}

---@enum OSTypes
M.OSTypes = {
	Undefined = "Undefined",
	Linux = "Linux",
	MacOS = "macOS",
	Windows = "Windows",
}

---@return string[]
function M.get_default_shell()
	if M.get_os() == M.OSTypes.Windows then
		return { "cmd" }
	elseif M.get_os() == M.OSTypes.Linux then
		return { "bash", "--login" }
	elseif M.get_os() == M.OSTypes.MacOS then
		return { "zsh", "--login" }
	else -- undefined
		return {}
	end
end

---@return OSTypes
function M.get_os()
	if wezterm.target_triple == "x86_64-pc-windows-msvc" then
		return M.OSTypes.Windows
	elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
		return M.OSTypes.Linux
	else
		return M.OSTypes.Undefined
	end
end

---@param filename string
---@return boolean
function M.file_exists(filename)
	local f = io.open(filename, "r")
	if f == nil then
		return false
	end
	f:close()
	return true
end

---@param filename string
---@return string[]?
function M.load_shell_command(filename)
	local f = io.open(filename, "r")
	if f == nil then
		return nil
	end
	local shell_cmd_str = f:read("*a")
	f:close()

	local shell_cmd = {}
	for str in shell_cmd_str:gmatch("[%a%p]+") do
		table.insert(shell_cmd, str)
	end

	if next(shell_cmd) == nil then
		return nil
	end
	return shell_cmd
end

---@param shell string
---@param os_type OSTypes
---@return boolean
function M.shell_exists(shell, os_type)
	if os_type == M.OSTypes.Windows then
		return shell_exists_win(shell)
	elseif os_type == M.OSTypes.Linux then
		return shell_exists_linux(shell)
	else
		return false
	end
end

---@param shell string
---@return boolean
function shell_exists_linux(shell)
	local result = generic_shell_finder("cat /etc/shells")
	if result ~= nil and string.find(result, shell) then
		return true
	else
		return false
	end
end

---@param shell string
---@return boolean
function shell_exists_win(shell)
	local result = generic_shell_finder("where " .. shell)
	if result == nil or result == "INFO: Could not find files for the given pattern(s)." then
		return false
	end

	if string.find(result, shell) then
		return true
	else
		return false
	end
end

---@param shell_find_command string
---@return string?
function generic_shell_finder(shell_find_command)
	local shells_handle = io.popen(shell_find_command)
	if shells_handle == nil then
		return nil
	end

	local shells = shells_handle:read("*a")
	shells_handle:close()
	-- wezterm.log_info(shells)
	return shells
end

return M
