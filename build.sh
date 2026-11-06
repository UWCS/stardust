#!/bin/sh
set -eu

cd "$(dirname "$0")"

sed -i 's/\(.*\)# DRAFT/# DRAFT \1/g' config.toml

./bin/zola build --base-url https://stardusty.containers.uwcs.co.uk --force

./node_modules/.bin/purgecss --config ./purgecss.config.js --preserve-paths
