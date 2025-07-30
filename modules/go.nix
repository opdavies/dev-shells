{
  perSystem =
    { pkgs, ... }:
    {
      devShells.go = pkgs.mkShell {
        packages = with pkgs; [
          go
          gopls
        ];

        shellHook = ''
          go version
        '';
      };
    };
}
