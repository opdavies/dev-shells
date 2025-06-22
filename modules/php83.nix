{
  commonPhpPackages,
  lib,
  pkgs,
}:

pkgs.mkShell {
  packages =
    with pkgs;
    [
      php83
      php83Packages.composer
    ]
    ++ commonPhpPackages;

  shellHook = ''
    ${lib.getExe pkgs.php83} --version
  '';
}
