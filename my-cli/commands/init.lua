local argparse = require("argparse")

local cmd = require("my-cli.commands.cmd")

local M = {}

---parse the command line arguments.
---@return table
---@return any
function M.parse()
  local parser = argparse()
    :name("my-cli")
    :description("Tool to do things")
    :epilog("For more information see: https://github.com/f4z3r/moap-lua-cli")
    :add_complete()
    :help_max_width(80)
    :command_target("command")
    :require_command(false)

  parser:flag("-V --version", "Print the version of my-cli.")
  parser:flag("-j --json", "Provide output in JSON")

  cmd.register_command(parser)

  return parser:parse(), parser
end

return M
