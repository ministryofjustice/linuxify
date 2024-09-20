#!/usr/bin/env bash

set -x

cat <<EOT
## 1) Set up a GPG Key using your email verified in GitHub.

## 2) Put public key on the clip board for pasting into GitHub at https://github.com/settings/gpg/new

## 2a) Enter a name (title) for the key
## 2b) Paste key from clipboard after running the following comand
gpg --armor --export $(gpg --list-secret-keys --keyid-format=long --with-colons | grep "^ssb" | cut -d ":" -f 5) | pbcopy
EOT


## Set up the .gitconfig file with the values from the GPG key

GPGKEY_ID="$(gpg --list-secret-keys --keyid-format=long --with-colons | grep "^ssb" | cut -d ":" -f 5)"


CONTACT="$(gpg --list-secret-keys --keyid-format=long --with-colons | grep "^uid" | cut -d ":" -f 10)"
USER_NAME="$(echo ${CONTACT} | cut -d " " -f 1)"
USER_EMAIL="$(echo ${CONTACT} | cut -d "<" -f 2 | cut -d ">" -f 1)"
USER_SIGNINGKEY="${GPGKEY_ID}"



## [user]
git config --global user.name "${USER_NAME}"
git config --global user.email "${USER_EMAIL}"
git config --global user.signingkey "${USER_SIGNINGKEY}"

## [commit]
git config --global commit.gpgsign true

## [init]
git config --global init.defaultBranch main

## [credential]
git config --global credential.helper osxkeychain

## [core]
git config --global core.pager "less -FX"
git config --global core.excludesfile "${HOME}/.gitignore"

#[filter "lfs"]
#	required = true
#	clean = git-lfs clean -- %f
#	smudge = git-lfs smudge -- %f
#	process = git-lfs filter-process

## Create excludes file

cat > ${HOME}/.gitignore <<EOT
# General
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon


# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
EOT
