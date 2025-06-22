{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    tailwindcss-language-server
    tailwindcss_4
    watchman
  ];
}
