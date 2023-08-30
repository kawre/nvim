local M = {}

function M.scandir(directory)
  local i, t, popen = 0, {}, io.popen
  local dir = string.format("ls -Ap %s | awk -F'[./]' '{print $1}'", directory)
  local pfile = popen(dir)

  for filename in pfile:lines() do
    if filename ~= "init" and filename ~= "" then
      i = i + 1
      t[i] = filename
    end
  end

  pfile:close()
  return t
end

return M
