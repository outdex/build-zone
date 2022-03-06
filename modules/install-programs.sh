#!/bin/sh

progsfile="https://raw.githubusercontent.com/outdex/build-zone/main/programs"

installpkg() { 
  pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

maininstall() {
   
    while read p; do
      installpkg "$p"
    done < (curl -Ls "$progsfile")
}

maininstall
