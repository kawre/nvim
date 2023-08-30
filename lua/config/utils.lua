local M = {}

function M.scandir(directory)
	local i, t, popen = 0, {}, io.popen
  local dir = string.format("ls -A %s | grep -E '.lua$'", directory)
	local pfile = popen(dir)
	for filename in pfile:lines() do
		i = i + 1
		t[i] = filename
	end
	pfile:close()
	return t
end

return M
