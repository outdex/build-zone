#!/bin/sh
user="dex"
sourcefile="https://raw.githubusercontent.com/outdex/build-zone/main/sources"
repodir="/home/$user/.local/src"

buildpkg() {
    progname="$(basename "$1" .git)"
    dir="$repodir/$progname"
    sudo -u "$user" git clone --depth 1 "$1" "$dir" >/dev/null 2>&1 || {
        cd "$dir" || return 1
        sudo -u "$user" git pull --force origin master
    }
    cd "$dir" || exit 1
    make >/dev/null 2>&1
    make install >/dev/null 2>&1
    cd /tmp || return 1
}

mainbuild() {
    sed -i "s/-j2/-j$(nproc)/;s/^#MAKEFLAGS/MAKEFLAGS/" /etc/makepkg.conf
    curl -Ls "$sourcefile" | while IFS= read -r p; do
        buildpkg "$p"
    done
}

mainbuild
