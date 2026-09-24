{ self, inputs, ... }:
let
  system = self.consts.systems.default;
  pkgs = import inputs.nixpkgs { inherit system; };
in
{
  flake.devShells.${system}.dev-shell-c = pkgs.mkShell (
    let
      toolchain = pkgs.llvmPackages_latest;
      shinirunc = pkgs.writeShellScriptBin "shinirunc" ''
        set -euo pipefail
        filename="$1"
        output="''${filename%.*}"
        clang -std=c23 -Wall -Wextra -g -fsanitize=address,undefined -o $output $1
      '';
    in
    {
      packages = [
        toolchain.clang
        toolchain.clang-tools
        toolchain.lldb
        pkgs.gdb
        shinirunc
      ];

      CPATH = "${pkgs.glibc.dev}/include";
      shellHook = ''
        export CC=clang
        export CXX=clang++
      '';
    }
  );
}
