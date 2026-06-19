#!/usr/bin/env bash
set -euo pipefail

readonly PROG_DIR=$(dirname $(realpath "$0"))
readonly NOTEBOOKS_DIR="${PROG_DIR}/../notebooks"

# Clean notebooks with nb-clean, preserving Colab-specific metadata (cellView, id, outputId)
find "$NOTEBOOKS_DIR" -type f -name "*.ipynb" -exec nb-clean clean --preserve-cell-metadata colab cellView id outputId -- {} \;
