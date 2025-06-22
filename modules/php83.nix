{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php83 = pkgs.mkShell {
        packages = with pkgs; [
          php83
          php83Packages.composer
          phpactor
        ];

        shellHook = ''
          php --version
        '';
      };
    };
}
