rm -f zola*-linux-gnu.tar.gz
# Get release info
release_data=$(curl -s https://api.github.com/repos/raven0034/zola/releases/230081571)
release_download=$(echo "$release_data" | grep browser_download_url | grep "$(uname -m)-unknown-linux-gnu.tar.gz" | cut -d '"' -f 4)

echo "Downloading $release_download"
wget -q --show-progress "$release_download"
mkdir -p bin

echo "Extract to ./bin"
tar -xvf zola*-linux-gnu.tar.gz -C "bin"

# Add to PATH grep $PWD/bin ~/.bashrc
if [ -f ~/.bashrc -a -z "$(grep $PWD/bin ~/.bashrc)" ]; then
    echo "Adding to \$PATH"
    echo -e "\nexport PATH=\"$PWD/bin:\$PATH\"\n" >> ~/.bashrc
    echo "Restart your terminal or run `source ~/.bashrc` to update \$PATH"
fi

rm -f zola*-linux-gnu.tar.gz