{ commonPhpPackages, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php83 = pkgs.mkShell {
        packages = with pkgs; [
          php83
          php83Packages.composer
        ] ++ commonPhpPackages pkgs;

        shellHook = ''
          php --version
        '';
      };
    };
}
