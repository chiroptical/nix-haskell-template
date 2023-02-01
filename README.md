nix-haskell-template
---

This is a cookiecutter repository which contains my current Haskell jumping
off point. Nix has the concepts of [zero-to-nix-templates][templates] but they
don't really offer the customizability I am looking for here.

## Get the template

To get this cookiecutter,

```shell
nix develop nixpkgs#cookiecutter --command cookiecutter gh:chiroptical/nix-haskell-template
```

You can install cookiecutter via [install-cookiecutter][their directions] and run,

```shell
cookiecutter gh:chiroptical/nix-haskell-template
```

This will create a directory with the package name you specify in
`cookiecutter`. If you `cd` into the directory, you'll see a scaffold for a
Haskell flake project.

## Using the template

You could simply `nix develop`, but I tend to prefer [direnv][direnv] and
[nix-direnv][nix-direnv]. To use these, follow their installation procedures
and add a file `.envrc` with contents:

```
use flake
```

Once you enter the shell, run `make run` and it should hopefully print the
package name you entered. It also will format both `haskell` and `nix` code for
you via `make format`. There are some other targets in the `Makefile`.

[zero-to-nix-templates]: https://zero-to-nix.com/concepts/flakes#templates
[install-cookiecutter]: https://cookiecutter.readthedocs.io/en/stable/installation.html#install-cookiecutter
[direnv]: https://direnv.net
[nix-direnv]: https://github.com/nix-community/nix-direnv
