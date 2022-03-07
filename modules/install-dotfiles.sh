#!/bin/sh

dotfiles="https://raw.githubusercontent.com/outdex/build-zone/main/programs"

installpkg() {
  pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

maininstall() {
  curl -Ls "$dotfiles" | while IFS= read -r p; do
    installpkg "$p"
  done
}

maininstall
