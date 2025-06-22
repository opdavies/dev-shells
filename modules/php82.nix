{
  commonPhpPackages,
  lib,
  pkgs,
  ...
}:

with pkgs;

mkShell {
  packages = [
    php82
    php82Packages.composer
  ] ++ commonPhpPackages;

  shellHook = ''
    ${lib.getExe php82} --version
  '';
}
