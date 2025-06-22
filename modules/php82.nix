{
  commonPhpPackages,
  lib,
  pkgs,
  ...
}:

pkgs.mkShell {
  packages =
    with pkgs;
    [
      php82
      php82Packages.composer
    ]
    ++ commonPhpPackages;

  shellHook = ''
    ${lib.getExe pkgs.php82} --version
  '';
}
