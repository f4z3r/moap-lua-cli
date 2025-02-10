local os = require("os")

local USERNAME_ENV_VAR = "MY_CLI_USER"

local M = {}

function M.get_auth()
  local username = assert(os.getenv(USERNAME_ENV_VAR), "username needs to be set")
  return username, "password"
end

return M
