{ pkgs, ... }:
pkgs.haskell.packages.ghc910.extend (
  final: prev: {
    {{ cookiecutter.package_name }} = final.callCabal2nix "{{ cookiecutter.package_name }}" ./. { };
  }
)
