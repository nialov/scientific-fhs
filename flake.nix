{
  description = "nix declared development environment";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages."${system}";
      in {
        devShells.default = import ./shell.nix {
          juliaVersion = "julia_16";
          inherit pkgs;
        };
      });
}
