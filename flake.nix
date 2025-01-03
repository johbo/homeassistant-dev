# Source: https://github.com/home-assistant/architecture/discussions/1086
{
  description = "A sample Flake for Home Assistant with Python 3.12 & uv";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [];
      };
      pythonEnv = pkgs.python313.withPackages (ps: with ps; [
        numpy
        pip
      ]);
    in
    {
      devShell = pkgs.mkShell {
        buildInputs = [
          pythonEnv
          # pkgs.uv
        ];
        shellHook = ''
          # TODO: Find a better way to provide these
          export DYLD_LIBRARY_PATH=${pkgs.libopus}/lib:${pkgs.lib.getLib pkgs.libjpeg_turbo}/lib

          # # Save the current value of the SHELL variable
          # original_shell=$SHELL
          # ./script/setup

          # # Switch back to the original shell
          # if [ -x "$original_shell" ]; then
          #   exec "$original_shell"
          # fi

          # source venv/bin/activate
        '';
        };
    });
}
