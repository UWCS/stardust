#!/bin/sh
set -e

cd "${0%/*}"
git pull --recurse-submodules

# Build draft
sed -i 's/# DRAFT//g' config.toml
./zola build --drafts --base-url https://draft.uwcs.co.uk --output-dir ../draft --force

git restore config.toml

# Build main
sed -i 's/\(.*\)# DRAFT/# DRAFT \1/g' config.toml
./zola build --base-url https://new.uwcs.co.uk --output-dir ../public --force
