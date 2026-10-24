{
  description = "{{ cookiecutter.package_description }}";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          function (
            import nixpkgs {
              inherit system;
              config.allowBroken = true;
            }
          )
        );
    in
    {
      devShells = forAllSystems (pkgs: {
        default = import ./shell.nix { inherit pkgs; };
      });

      formatter = forAllSystems (
        pkgs:
        pkgs.nixfmt-tree.override {
          settings.tree-root-file = "flake.nix";
        }
      );

      packages = forAllSystems (
        pkgs:
        let
          {{ cookiecutter.package_name }} = pkgs.callPackage ./{{ cookiecutter.package_name }}.nix { };
        in
        {
          inherit {{ cookiecutter.package_name }};
          default = {{ cookiecutter.package_name }};
        }
      );

      checks = forAllSystems (
        pkgs:
        let
          {{ cookiecutter.package_name }} = pkgs.callPackage ./{{ cookiecutter.package_name }}.nix { };
        in
        {
          format =
            pkgs.runCommand "format"
              {
                nativeBuildInputs = [
                  pkgs.haskellPackages.fourmolu
                  pkgs.nixfmt-tree
                  pkgs.findutils
                ];
              }
              ''
                cp -R ${self} source
                chmod -R u+w source
                cd source
                find app src test -name '*.hs' -exec fourmolu --mode check {} +
                treefmt --ci --tree-root . --walk filesystem
                touch $out
              '';
          test = pkgs.haskell.lib.doCheck {{ cookiecutter.package_name }};
        }
      );
    };
}
