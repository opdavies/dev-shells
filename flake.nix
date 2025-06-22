{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      inherit (pkgs) callPackage;

      commonPhpPackages = with pkgs; [
        phpactor
      ];
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [ nixd ];
        };

        nodejs = callPackage ./modules/nodejs.nix { };

        php82 = callPackage ./modules/php82.nix { inherit commonPhpPackages; };

        php83 = callPackage ./modules/php83.nix { inherit commonPhpPackages; };
      };

      formatter.${system} = pkgs.nixfmt-rfc-style;
    };
}
