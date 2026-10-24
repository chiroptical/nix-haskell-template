{ pkgs, ... }:
let
  haskell = pkgs.callPackage ./haskell.nix { };
in
haskell.{{ cookiecutter.package_name }}
