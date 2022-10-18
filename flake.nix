{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        {
          packages = rec {
            cp-maps = pkgs.callPackage ./package.nix { };
            default = cp-maps;
          };
          devShell = pkgs.mkShell {
            packages = with pkgs; [
              jq
              libsixel
            ];
          };
        }) // {
      overlays.default = final: prev:
        let
          pkgs = import nixpkgs {
            inherit (prev) system;
          };
        in
        {
          cp-maps = pkgs.callPackage ./package.nix { };
        };
    };
}
