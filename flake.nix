{
  inputs = {
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        { config, pkgs, ... }:
        let
          inherit (pkgs) callPackage;

          commonPhpPackages = with pkgs; [
            phpactor
          ];
        in
        {
          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [ nixd ];
            };

            nodejs = callPackage ./modules/nodejs.nix { };

            php82 = callPackage ./modules/php82.nix { inherit commonPhpPackages; };

            php83 = callPackage ./modules/php83.nix { inherit commonPhpPackages; };

            tailwindcss = callPackage ./modules/tailwindcss.nix { };
          };

          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
