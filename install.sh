#!/bin/bash

set -e

INSTALL_DIR="/usr/local/bin"
REPO="anggafreefire0123-droid/wordfetch"
BRANCH="main"

echo "Installing Wordfetch..."

if [ "$EUID" -ne 0 ]; then
echo "Please run as root or using sudo."
exit 1
fi

TEMP_FILE="$(mktemp)"

trap 'rm -f "$TEMP_FILE"' EXIT

if ! command -v curl >/dev/null 2>&1; then
echo "Error: curl is required."
exit 1
fi

curl -fsSL "https://raw.githubusercontent.com/$REPO/$BRANCH/wordfetch" -o "$TEMP_FILE"

install -m 755 "$TEMP_FILE" "$INSTALL_DIR/wordfetch"

echo
echo "Wordfetch installed successfully!"
echo
echo "Run it with:"
echo "  wordfetch"
