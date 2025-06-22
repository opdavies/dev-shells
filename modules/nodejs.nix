{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    bun
    eslint_d
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    prettier
  ];
}
