{
  commonPhpPackages,
  lib,
  pkgs,
}:

with pkgs;

mkShell {
  packages = [
    php83
    php83Packages.composer
  ] ++ commonPhpPackages;

  shellHook = ''
    ${lib.getExe php83} --version
  '';
}
