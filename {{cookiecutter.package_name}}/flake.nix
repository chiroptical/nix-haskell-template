{
  description = "{{ cookiecutter.package_description }}";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "x86_64-darwin" "aarch64-darwin"] (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowBroken = true;
      };
      {{ cookiecutter.package_name }} = pkgs.callPackage ./{{ cookiecutter.package_name }}.nix {};
    in {
      devShell = import ./shell.nix {
        inherit pkgs;
      };
      defaultPackage = {{ cookiecutter.package_name }};
      packages = flake-utils.lib.flattenTree {
        inherit {{ cookiecutter.package_name }};
      };
    });
}
