rm -f zola*-linux-musl.tar.gz
# Get release info
release_data=$(curl -s https://api.github.com/repos/ericthelemur/zola/releases/latest)
release_download=$(echo "$release_data" | grep browser_download_url | grep linux-musl.tar.gz\" | cut -d '"' -f 4)

echo "Downloading $release_download"
wget -q --show-progress "$release_download"
mkdir -p bin

echo "Extract to ./bin"
tar -xvf zola*-linux-musl.tar.gz -C "bin"

# Add to PATH grep $PWD/bin ~/.bashrc
if [ -f ~/.bashrc -a -z "$(grep $PWD/bin ~/.bashrc)" ]; then
    echo "Adding to \$PATH"
    echo -e "\nexport PATH=\"$PWD/bin:\$PATH\"\n" >> ~/.bashrc
    echo "Restart your terminal or run `source ~/.bashrc` to update \$PATH"
fi

rm -f zola*-linux-musl.tar.gz