#!/bin/sh
set -e

cd "${0%/*}"
git pull --recurse-submodules

# Build draft
sed -i 's/# DRAFT//g' config.toml
./zola build --drafts --base-url https://draft.uwcs.co.uk --output-dir draft --force
chmod -R 755 draft

git restore config.toml

# Build main
./zola build --base-url https://new.uwcs.co.uk
chmod -R 755 public