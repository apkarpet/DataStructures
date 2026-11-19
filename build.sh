#!/usr/bin/env bash
# Build every C program into build/. Run the programs from the folder that holds
# their CSV file, e.g.:  cd "final/PART II" && ../../build/part2_final
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build
while IFS= read -r src; do
  dir=$(dirname "$src"); name=$(basename "${src%.c}")
  case "$dir" in set1*) name="set1_$name" ;; set2*) name="set2_$name" ;; esac
  gcc -std=gnu17 -O2 -Wall -o "build/$name" "$src" -lm -pthread
  echo "built build/$name"
done < <(find set1 set2 final -name '*.c' | sort)
