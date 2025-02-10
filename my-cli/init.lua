local M = {}

M.VERSION = "0.1.0"

function M.main()
  local commands = require("my-cli.commands")
  local opts, parser = commands.parse()
  if opts.version then
    print("my-cli version v" .. M.VERSION)
    return
  end

  local cmd = opts.command
  if not cmd then
    print(parser:get_usage())
    return
  end
  require("my-cli.commands." .. cmd).execute(opts)
end

return M
