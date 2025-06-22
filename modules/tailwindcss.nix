{ lib, pkgs }:

with pkgs;

mkShell {
  packages = [
    tailwindcss-language-server
    tailwindcss_4
    watchman
  ];

  shellHook = ''
    ${lib.getExe tailwindcss_4} --help
  '';
}
