nix-haskell-template
---

This is a cookiecutter respository which contains my current Haskell jumping
off point. Nix has the concepts of [zero-to-nix-templates][templates] but they
don't really offer the customizability I am looking for here. To get this
cookiecutter,

```shell
nix develop nixpkgs#cookiecutter --command cookiecutter gh:chiroptical/nix-haskell-template
```

You can install cookiecutter via [install-cookiecutter][their directions] and run,

```shell
cookiecutter gh:chiroptical/nix-haskell-template
```

[zero-to-nix-templates]: https://zero-to-nix.com/concepts/flakes#templates
[install-cookiecutter]: https://cookiecutter.readthedocs.io/en/stable/installation.html#install-cookiecutter
