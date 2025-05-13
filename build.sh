#!/bin/sh
set -e

# Switch to git user if running as root (for non-CI runs only)
if [ $(whoami) != "git-user" ]; then
    echo "Run script as git-user only. Aborting..."
    exit
fi

export SCRIPT_DIR=$(dirname "$(realpath $0)")
cd $SCRIPT_DIR && echo "Running in $SCRIPT_DIR"
if [ -z $NO_PULL ]; then git pull --recurse-submodules; fi

# Build draft
sed -i 's/# DRAFT//g' config.toml
./zola build --drafts --base-url https://draft.uwcs.co.uk --output-dir ../draft --force
./zola build --drafts --base-url https://sponsors.uwcs.co.uk --output-dir ../sponsors --force

sleep 5
git restore config.toml
rm -rf ../build

# Build main
sed -i 's/\(.*\)# DRAFT/# DRAFT \1/g' config.toml
./zola build --base-url https://uwcs.co.uk --output-dir ../build --force

git restore config.toml

# Remove redundant css from prod site
if which purgecss; then
    (
    cd ../build
    purgecss --config $SCRIPT_DIR/purgecss.config.js
    purgecss --config $SCRIPT_DIR/purgecss.config.js --css icon-packs/*.css --output icon-packs
    )
fi

# Swap versions asap
[ -d "../public" ] && mv ../public ../old
mv ../build ../public
rm -rf ../old
