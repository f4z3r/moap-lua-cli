local io = require("io")
local os = require("os")
local string = require("string")

local M = {}

---run a command return the output
---@param cmd string
---@return boolean success
---@return string? stdout from the command
function M.run(cmd)
  local filename = os.tmpname()
  local command = string.format("%s &> %s", cmd, filename)
  local success, _, code = os.execute(command)
  local fh = assert(io.open(filename, "r"))
  local out = fh:read("*a")
  fh:close()
  os.remove(filename)
  if type(success) == "number" then
    return success == 0, out
  end
  if not success and code ~= nil then
    return false, out
  end
  return true, out
end

return M
