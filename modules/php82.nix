{
  perSystem =
    { pkgs, ... }:
    {
      devShells.php82 = pkgs.mkShell {
        packages = with pkgs; [
          php82
          php82Packages.composer
          phpactor
        ];

        shellHook = ''
          php --version
        '';
      };
    };
}
