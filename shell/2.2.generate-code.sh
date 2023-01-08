#! usr/bin/bash

# Go to root
source ./utils.sh
to-root 

# Excute
fvm flutter pub run build_runner build --delete-conflicting-outputs