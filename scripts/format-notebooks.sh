#!/usr/bin/env bash
set -euo pipefail

readonly PROG_DIR=$(dirname $(realpath "$0"))
readonly NOTEBOOKS_DIR="${PROG_DIR}/../notebooks"

if ! which jq &> /dev/null; then
    echo "Error: jq must be installed" >&2
fi

while read src_file; do
    tmp_file="${src_file}.tmp"

    mv "$src_file" "$tmp_file"

    cat "$tmp_file" | jq > "$src_file"
    rm "$tmp_file"

    echo "Formatted $src_file"
done <<< $(find "$NOTEBOOKS_DIR" -type f)
