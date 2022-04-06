#!/bin/sh

progsfile="https://raw.githubusercontent.com/outdex/build-zone/main/programs"

installpkg() {
  pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

maininstall() {
  curl -Ls "$progsfile" | while IFS= read -r p; do
    installpkg "$p"
  done
}

checkdeps() {
  command -v curl >/dev/null 2>&1 || { echo >&2 installpkg curl; exit 1; }
}

checkdeps
maininstall
