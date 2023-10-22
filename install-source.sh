echo "Downloading source"
git clone https://github.com/ericthelemur/zola
cd zola
echo "Building & installing (may take quite a while)..."
cargo install --path .
