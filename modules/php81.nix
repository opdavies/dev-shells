{ commonPhpPackages, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php81 = pkgs.mkShell {
        packages = with pkgs; [
          php81
          php81Packages.composer
        ] ++ commonPhpPackages pkgs;

        shellHook = ''
          composer -V
        '';
      };
    };
}
