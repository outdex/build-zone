#!/bin/sh
user="dex"
dotfilesrepo="https://github.com/outdex/ledot-zone.git"
repobranch="main"

clonegitrepo() {
    [ -z "$3" ] && branch="main" || branch="$repobranch"
    dir=$(mktemp -d)
    [ ! -d "$2" ] && mkdir -p "$2"
    chown "$user":wheel "$dir" "$2"
    sudo -u "$user" git clone --recursive -b "$branch" --depth 1 --recurse-submodules "$1" "$dir" >/dev/null 2>&1
    sudo -u "$user" cp -rfT "$dir" "$2"
}

createsymlinks(){
    ln -s /home/$user/.config/x11/xprofile /home/$user/.xprofile
    ln -s /home/$user/.config/x11/xinitrc /home/$user/.xinitrc
}

clonegitrepo "$dotfilesrepo" "/home/$user" "$repobranch"
createsymlinks
