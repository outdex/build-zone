#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

echo "SCRIPTPATH: $SCRIPTPATH"

checkrunasroot(){
  if [ ! `id -u` = 0 ] ; then
      echo "ERROR: This script must be run as the root user"
      exit 1
  fi
}
checkrunasroot
# source ./modules/install-programs.sh
# source ./modules/install-programs.sh
# source ./modules/install-programs.sh