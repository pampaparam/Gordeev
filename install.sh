#!/bin/sh

# see ./tools/package-managers/mise.md
curl -fsSL https://mise.run | sh
mise use -g node@latest
mise use -g go@latest
mise use -g ruby@latest
# package manager for python
mise use -g uv@latest

# brew
brew install --cask visual-studio-code

# yandex-cli
curl -fsSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash
