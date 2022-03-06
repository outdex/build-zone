#!/bin/sh

installpkg() { 
  pacman --noconfirm --needed -S "$1" >/dev/null 2>&1
}

maininstall() { 
    while read p; do
      installpkg "$p"
    done <programs
}

maininstall
