echo "This is untested, use with some caution"
echo "Currently Zola builds are only for M1 Macs; use install-source.sh on any other"

rm -f zola*-apple-darwin.zip

# Get release info
release_data=$(curl -s https://api.github.com/repos/ericthelemur/zola/releases/latest)
release_download=$(echo "$release_data" | grep browser_download_url | grep apple-darwin.zip\" | cut -d '"' -f 4)

echo "Downloading $release_download"
wget -q --show-progress "$release_download"
mkdir -p bin

echo "Extract to ./bin"
tar -xvf zola*-apple-darwin.zip -C "bin"

# Add to PATH in ~/.zshrc
if [ -f ~/.zshrc ] && ! grep -q "$PWD/bin" ~/.zshrc; then
    echo "Adding to \$PATH in .zshrc"
    printf "\nexport PATH=\"%s/bin:\$PATH\"\n" "$PWD" >> ~/.zshrc
    echo "Restart your terminal or run 'source ~/.zshrc' to update \$PATH"
fi

rm -f zola*-apple-darwin.zip
