-- ~/.config/yazi/init.lua

-- set custom folder rules (e.g. sort by date modified in Downloads folder)
require("folder-rules"):setup()

-- adds size and modified time to right of file/dir row
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

-- add symlink info to status bar (at bottom)
function Status:name()
	local h = self._current.hovered
	if not h then
		return ""
	end

	local linked = ""
	if h.link_to ~= nil then
		linked = " -> " .. tostring(h.link_to)
	end
	return ui.Line(" " .. h.name:gsub("\r", "?", 1) .. linked)
end
