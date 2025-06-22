{
  perSystem =
    { pkgs, ... }:
    {
      devShells.tailwindcss = pkgs.mkShell {
        packages = with pkgs; [
          tailwindcss-language-server
          tailwindcss_4
          watchman
        ];

        shellHook = ''
          tailwindcss --help
        '';
      };
    };
}
