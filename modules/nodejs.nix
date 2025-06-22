{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    bun
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
    prettier
  ];
}
