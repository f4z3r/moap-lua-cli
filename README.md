# MOAP for Lua CLIs

This project serves as the mother of all projects (MOAP) for my LuaJIT based CLI tools. It contains
a base structure to quickly extend it with commands, configure it via environment variables, and run
external commands.

It uses the following libraries by default:

- `argparse` for command parsing,
- `rapidjson` for JSON parsing,
- `http` for network requests,
- `luatext` for colored output.

## Development

You can setup a dev environment with the needed Lua version:

```sh
# launch shell with some lua version and the dependencies installed:
nix develop .#lua52
```

## Roadmap

Generally, my CLI implement the following features that should be migrated into this MOAP:

- A standardized way to output results in JSON.
- A standardized way of performing error handling and fail intelligently for CLI standards.
- Spinners and progress bars.
- Standard utilities for executing external programs, or socket communication with other processes.
