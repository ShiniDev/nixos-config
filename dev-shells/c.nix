{ self, inputs, ... }:
let
  system = self.consts.systems.default;
  pkgs = import inputs.nixpkgs { inherit system; };
in
{
  flake.devShells.${system}.dev-shell-c = pkgs.mkShell (
    let
      toolchain = pkgs.llvmPackages;
    in
    {
      packages =
        with toolchain;
        [
          clang
          clang-tools
          lldb
        ]
        ++ (with pkgs; [
          gdb
        ]);

      CPATH = "${pkgs.glibc.dev}/include";
      shellHook = ''
        export CC=clang
        export CXX=clang++
      '';
    }
  );
}
