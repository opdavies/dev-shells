{ commonPhpPackages, inputs, ... }:

{
  perSystem =
    { pkgs, system, ... }:
    let
      pkgs-php74 = import inputs.nixpkgs-php74 { inherit system; };

      php = pkgs-php74.php74;
      phpPackages = pkgs-php74.php74Packages;
    in
    {
      devShells.php74 = pkgs.mkShell {
        packages = [
          php
          phpPackages.composer
        ] ++ commonPhpPackages pkgs;

        shellHook = ''
          php --version
        '';
      };
    };
}
