#!/bin/bash

set -e

INSTALL_DIR="/usr/local/bin"

echo "Installing Wordfetch..."

if [ "$EUID" -ne 0 ]; then
    echo "Please run this installer with sudo or as root."
    exit 1
fi

if [ ! -f "wordfetch" ]; then
    echo "Error: Wordfetch program not found."
    exit 1
fi

install -m 755 wordfetch "$INSTALL_DIR/wordfetch"

echo
echo "Wordfetch installed successfully!"
echo
echo "Run it with:"
echo "  wordfetch"
