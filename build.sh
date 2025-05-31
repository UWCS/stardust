#!/bin/sh
set -e

# Switch to git user if running as root (for non-CI runs only)
if [ $(whoami) != "git-user" ]; then
    echo "Run script as git-user only. Aborting..."
    exit
fi

# Move to project root dir
export SCRIPT_DIR=$(dirname "$(realpath $0)")
cd $SCRIPT_DIR && echo "Running in $SCRIPT_DIR"

# Record pid to ensure only one running
if [ -f "./stardust.pid" ];
then
    if ps -p $(cat "./stardust.pid"); then
        echo "Cancelling other run..."
        kill $(cat "./stardust.pid")
        sleep 3
    fi

    rm -f "./stardust.pid"
fi

echo $$ > "./stardust.pid"

pids=$(pgrep -u git-user -f 'zola build') || true
if [ -n "$pids" ]; then
    echo "Killing lingering zola builds: $pids"
    kill $pids
    sleep 3
fi


# Pull changes
if [ -z $NO_PULL ]; then git pull --recurse-submodules; fi

# Build draft
sed -i 's/# DRAFT//g' config.toml
./zola build --drafts --base-url https://draft.uwcs.co.uk --output-dir ../draft --force

# Build main
git restore config.toml
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

# Stop storing pid (ensures cancel doesn't come mid move)
rm -f "./stardust.pid"

# Swap versions asap
[ -d "../public" ] && mv ../public ../old
mv ../build ../public
rm -rf ../old
