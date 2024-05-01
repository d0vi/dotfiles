#!/bin/bash

if ! command -v brew &> /dev/null; then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "✅️ Homebrew has been successfully installed"
else
    echo "✅️ Homebrew is already installed"
fi
