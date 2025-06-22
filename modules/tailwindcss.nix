{ lib, pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    tailwindcss-language-server
    tailwindcss_4
    watchman
  ];

  shellHook = ''
    ${lib.getExe pkgs.tailwindcss_4} --help
  '';
}
