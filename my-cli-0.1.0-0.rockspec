local package_name = "my-cli"
local package_version = "0.1.0"
local rockspec_revision = "0"
local account_name = "f4z3r"
local repo_name = package_name

rockspec_format = "3.0"
package = package_name
version = package_version .. "-" .. rockspec_revision

source = {
  url = "git://github.com/" ..account_name .. "/" ..package_name..".git",
  tag = "v0.1.0",
}

description = {
  summary = "A CLI that is super useful...",
  detailed = [[
    TODO
  ]],
  homepage = "https://github.com/" ..account_name .. "/" ..package_name,
  license = "MIT <http://opensource.org/licenses/MIT>",
}

dependencies = {
  "lua == 5.1",
  "argparse >= 0.7",
  "rapidjson >= 0.7",
  "http >= 0.3",
  "basexx >= 0.4",
  "luatext >= 1.1",
  -- "luatables >= 0.1",
}

test_dependencies = {
  "busted >= 2.0",
}

test = {
  type = "busted",
}

build = {
  type = "builtin",
  modules = {
    ["my-cli"] = "my-cli/init.lua",
    ["my-cli.commands"] = "my-cli/commands/init.lua",
    ["my-cli.commands.cmd"] = "my-cli/commands/cmd.lua",
    ["my-cli.utils"] = "my-cli/utils.lua",
    ["my-cli.config"] = "my-cli/config.lua",
  },
  install = {
    bin = {
      ["my-cli"] = "bin/my-cli",
    },
  },
}
