ZIP_SHA="29fff85e0afe0bd723fbd84e6c9587b08fd277cacc516d49bd379faa95612ac3"

FILE=FiraMono.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraMono.zip

DOWNLOAD_SHA=$(sha256sum "$FILE" | awk '{print $1}')

if ! [[ "$ZIP_SHA" == "$DOWNLOAD_SHA" ]]; then
  echo "Downloaded file does not equal expected. Update probably required."
  rm -f "$FILE"
  exit 1
fi

INSTALLATION_PATH="$HOME/.local/share/fonts/nerd-fonts"

mkdir -p "$INSTALLATION_PATH"
unzip "$FILE" -d $INSTALLATION_PATH
rm -f "$INSTALLATION_PATH/LICENSE.txt"
rm -f "$INSTALLATION_PATH/readme.md"
rm -f "$FILE"

fc-cache -vf

echo "Font installed."
