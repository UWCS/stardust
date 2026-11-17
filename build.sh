#!/bin/bash
set -eu

cd "$(dirname "$0")"

echo "Building draft..."
./bin/zola --config config.draft.toml build --drafts --base-url https://draft.uwcs.co.uk --output-dir ./draft/public --force
cd draft
../node_modules/.bin/purgecss --config ../purgecss.config.js --preserve-paths
cd ..

echo "Building main site..."
./bin/zola build --base-url https://uwcs.co.uk --output-dir ./prod/public --force
cd prod
../node_modules/.bin/purgecss --config ../purgecss.config.js --preserve-paths
cd ..
