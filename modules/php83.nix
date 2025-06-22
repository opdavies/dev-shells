{ commonPhpPackages, pkgs }:

pkgs.mkShell {
  packages =
    with pkgs;
    [
      php83
      php83Packages.composer
    ]
    ++ commonPhpPackages;
}
