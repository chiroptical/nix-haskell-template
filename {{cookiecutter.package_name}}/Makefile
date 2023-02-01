build: hpack
	cabal build

hpack:
	hpack .

test: hpack
	cabal test

run: hpack
	cabal run

format-haskell:
	find app/ src/ test/ -name "*.hs" -exec fourmolu -i {} +

format-nix:
	alejandra --quiet .

format: format-nix format-haskell

ghcid: hpack
	ghcid -c cabal repl

.PHONY: hpack build test run format-haskell format-nix format ghcid
