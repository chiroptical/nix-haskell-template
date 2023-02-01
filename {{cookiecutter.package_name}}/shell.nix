{pkgs, ...}:
pkgs.mkShell {
  inputsFrom = [
    (import ./{{ cookiecutter.package_name }}.nix pkgs).env
  ];
  buildInputs = with pkgs; [
    haskellPackages.cabal-install
    haskellPackages.ghcid
    haskellPackages.hlint
    haskellPackages.hpack
    haskellPackages.retrie
    haskellPackages.fourmolu
    alejandra
  ];
  withHoogle = true;
  LANG = "en_US.utf8";
}

