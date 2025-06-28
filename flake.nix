{
  inputs = {
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-php74.url = "github:nixos/nixpkgs/81b77fd3847a";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      imports = [
        ./modules/nodejs.nix
        ./modules/php74.nix
        ./modules/php81.nix
        ./modules/php82.nix
        ./modules/php83.nix
        ./modules/tailwindcss.nix
      ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [ nixd ];
          };

          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
