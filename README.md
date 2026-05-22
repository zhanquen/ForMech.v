# ForMech.v

A Coq- and Mathematical Components-based formalization project for
mechanism design, `ForMech.v`.

The project is a fork of the repository `mech.v`:
https://github.com/jouvelot/mech.v

This project specifically focuses on the formalization of:

- Mechanism with tie-breaking and indifferent to ties

- A hierarchy of mechanisms

- Mechanism under Incomplete Information Game modeling

- Etc.

This branch is being ported to Rocq and Mathematical Components through a
reproducible Nix environment.

# Environment

The current local environment is managed by `nix-shell` through
`rocq-community/coq-nix-toolbox`.

Tested tool versions in the current shell:

- Rocq: 9.1.1
- Rocq compatibility command `coqc`: 9.1.1
- Mathematical Components: 2.5.0
- `coq-lsp`: 0.2.5
- Dune: 3.17.2

The Nix bundle is defined in `.nix/config.nix` as:

```nix
default-bundle = "rocq-9.1-mathcomp-2.5";
```

with:

```nix
rocqPackages.rocq-core.override.version = "9.1";
rocqPackages.mathcomp.override.version = "2.5.0";
```

MathComp 2.5.0 is used with Rocq 9.1 because MathComp 2.5.0 does not support
Rocq 9.2 in the current Nix package set.

# Installation

Install Nix first:

https://nixos.org/download/

Then clone this repository:

```sh
git clone https://github.com/zhanquen/ForMech.v.git
cd ForMech.v
```

Enter the development environment:

```sh
nix-shell
```

Check the active versions:

```sh
rocq --version
coqc --version
dune --version
```

Build the project:

```sh
dune build
```

The port is still in progress. At the time of this note, the Nix shell reaches
Rocq 9.1.1 and MathComp 2.5.0, and compilation progresses through many modules,
but `dune build` still stops in duplicated proof code in
`Search_as_General.v` and `VCG_Search_as_General_VCG.v`.

# VS Code

VS Code is the recommended editor setup for this repository.

Install VS Code:

https://code.visualstudio.com/

Install the VS Code extension:

```sh
code --install-extension ejgallego.coq-lsp
```

Open the repository:

```sh
cd ForMech.v
code .
```

This repository includes `.vscode/settings.json`, which starts `coq-lsp`
through `.vscode/coq-lsp-nix.sh`. The wrapper enters this repository's
`nix-shell`, so Rocq and MathComp are resolved from the same environment used
by the command-line build.

If the Coq LSP extension fails to start after cloning into a different local
path, replace the relative setting in `.vscode/settings.json` with an absolute
path:

```json
"coq-lsp.path": "/absolute/path/to/ForMech.v/.vscode/coq-lsp-nix.sh"
```

Then reload VS Code:

```text
Developer: Reload Window
```

Useful VS Code task:

```text
Terminal > Run Task... > Rocq: dune build
```

If older Coq extensions are installed, disable them for this workspace and keep
only `Coq LSP` enabled. Running multiple Coq/Rocq VS Code extensions on the
same `.v` file can cause competing proof panels or language-server startup
failures.

# RocqIDE and Other Editors

The current Nix shell provides Rocq command-line tools and `coq-lsp`, but not a
GUI `rocqide` or `coqide` binary.

You can still edit `.v` files with any editor and use the terminal build:

```sh
cd ForMech.v
nix-shell
dune build
```

Emacs with Proof General can be launched through:

```sh
nix-shell --arg withEmacs true --run "emacs mech/lib.v"
```

# Bibliography

Find below some links to bibliography and related projects:

- Contributors' Mines Paris technical report, "A Foundational Framework for the
  Specification and Verification of Mechanism Design"
  (https://www.cri.mines-paristech.fr/classement/doc/E-458.pdf)

- "Computer-aided verification in mechanism design"
  https://arxiv.org/abs/1502.04052

# Documentation

- See file headers for proper description

- Abstract presented at POPL 2026 RocqPL workshop (see
  [.pdf file](https://minesparis-psl.hal.science/hal-05493994v1/file/abstract-vcg.pdf))

# Main contributors

- Zhan Jing, Jiao Tong U.
- Pierre Jouvelot, Mines Paris, Université PSL
