#!/bin/bash

# a small script to download specific files from git repositories make sure to use raw.github url
download_git_files() {
    url=$1
    destination=$2

    filename=$(basename "$url")
    file_path="$destination/$filename"

    git clone --depth 1 "$url" "$destination"
    cd "$destination"
    git checkout HEAD -- "$file_path"
}

