{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem
    (system: let
      pkgs = import nixpkgs {inherit system;};
      luaPackages = {
        lua54 = pkgs.lua54Packages;
        lua53 = pkgs.lua53Packages;
        lua52 = pkgs.lua52Packages;
        lua51 = pkgs.lua51Packages;
        luajit = pkgs.luajitPackages;
        default = pkgs.luajitPackages;
      };
      custom-lua-packages = luaPkgs:
        with luaPkgs; let
          luatext = buildLuarocksPackage {
            pname = "luatext";
            version = "1.2.0-0";
            knownRockspec =
              (pkgs.fetchurl {
                url = "mirror://luarocks/luatext-1.2.0-0.rockspec";
                sha256 = "1lmjhsnbpz4wkaypqaqas0rlahbhpsr0g9wgls6lsswh3dh5xx28";
              })
              .outPath;
            src = pkgs.fetchFromGitHub {
              owner = "f4z3r";
              repo = "luatext";
              rev = "c8ada5144c7c23d44d37a10fa484fe91b34c11d0";
              sha256 = "sha256-gvRGBrJwkKEEnH2N0HaC099Tq0aKqqBdbwWrZTQ/1EA=";
            };

            disabled = luaOlder "5.1";
            propagatedBuildInputs = [lua];

            meta = {
              homepage = "https://github.com/f4z3r/luatext/tree/main";
              description = "A small library to print colored text";
              license.fullName = "MIT";
            };
          };
        in [luatext];
      makeLuaShell = shellName: luaPackage:
        pkgs.mkShell {
          packages = with pkgs;
            [
              selene
              stylua
            ]
            ++ (with luaPackage;
              [busted argparse compat53 basexx http rapidjson]
              ++ (custom-lua-packages luaPackage));
          shellHook = ''
            export LUA_PATH="./?.lua;./?/init.lua;$LUA_PATH"
            $SHELL && exit
          '';
        };
    in {
      devShells = builtins.mapAttrs makeLuaShell luaPackages;
    });
}
