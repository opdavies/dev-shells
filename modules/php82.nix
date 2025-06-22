{ commonPhpPackages, pkgs, ... }:

pkgs.mkShell {
  packages =
    with pkgs;
    [
      php82
      php82Packages.composer
    ]
    ++ commonPhpPackages;
}
