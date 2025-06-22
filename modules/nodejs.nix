{ lib, pkgs }:

with pkgs;

mkShell {
  packages = [
    bun
    eslint_d
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    prettier
  ];

  shellHook = ''
    echo "nodejs $(${lib.getExe nodejs} --version)"
  '';
}
