local M = {}

function M.register_command(parser)
  local sniff_parser = parser:command("cmd"):summary("Do things"):description("Description")

  sniff_parser:argument("instance", "some args"):args("?")
  sniff_parser:flag("-d --dump", "some flag to dump stuff")
  sniff_parser:option("-t --type", "some option to type.")
end

function M.execute(_options)
  print("executing cmd")
end

return M
