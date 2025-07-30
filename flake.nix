{
  inputs = {
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";

    import-tree.url = "github:vic/import-tree";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-php74.url = "github:nixos/nixpkgs/81b77fd3847a";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      _module.args = {
        commonPhpPackages = pkgs: with pkgs; [ phpactor ];
      };

      imports = [ (inputs.import-tree ./modules) ];

      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [ nixd ];
          };
        };
    };
}
