{ commonPhpPackages, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php82 = pkgs.mkShell {
        packages = with pkgs; [
          php82
          php82Packages.composer
        ] ++ commonPhpPackages pkgs;

        shellHook = ''
          composer -V
        '';
      };
    };
}
