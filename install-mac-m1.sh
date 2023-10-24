echo "This is untested, use with some caution"
echo "Currently Zola builds are only for M1 macs, use install-source.sh on any other"

rm -f zola*-apple-darwin.zip
# Get release info
release_data=$(curl -s https://api.github.com/repos/ericthelemur/zola/releases/latest)
release_download=$(echo "$release_data" | grep browser_download_url | grep apple-darwin.zip\" | cut -d '"' -f 4)

echo "Downloading $release_download"
wget -q --show-progress "$release_download"
mkdir -p bin

echo "Extract to ./bin"
tar -xvf zola*-apple-darwin.zip -C "bin"

# Add to PATH grep $PWD/bin ~/.bash_profile
if [ -f ~/.bash_profile -a -z "$(grep $PWD/bin ~/.bash_profile)" ]; then
    echo "Adding to \$PATH"
    echo -e "\nexport PATH=\"$PWD/bin:\$PATH\"\n" >> ~/.bash_profile
    echo "Restart your terminal or run `source ~/.bash_profile` to update \$PATH"
fi

rm -f zola*-apple-darwin.zip