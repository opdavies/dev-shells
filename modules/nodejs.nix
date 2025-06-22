{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    nodePackages.pnpm
    nodePackages.yarn
  ];
}
