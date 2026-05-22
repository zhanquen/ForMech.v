#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
exec nix-shell --option warn-dirty false --run "coq-lsp"
