{ pkgs, ... }:
let
  haskell = pkgs.callPackage ./haskell.nix { };
in
haskell.shellFor {
  packages = p: [ p.{{ cookiecutter.package_name }} ];
  nativeBuildInputs = with pkgs; [
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.hlint
    haskellPackages.hpack
    haskellPackages.fourmolu
    haskellPackages.haskell-language-server
    (nixfmt-tree.override {
      settings.tree-root-file = "flake.nix";
    })
  ];
  withHoogle = true;
}
