{ commonPhpPackages, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php84 = pkgs.mkShell {
        packages = with pkgs; [
          php84
          php84Packages.composer
        ] ++ commonPhpPackages pkgs;

        shellHook = ''
          composer -V
        '';
      };
    };
}
