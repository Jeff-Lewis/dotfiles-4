#!/usr/bin/env bash
#
# BespokeView Consulting, Inc.
# <ryan@bespokeview.com>
#
# git@github.com:ryanjohnston/dotfiles.git
#
# Borrowing heavily from other projects:
#
# https://github.com/pstadler/keybase-gpg-github
# https://github.com/holman/dotfiles

cd "$(dirname "$0")/.."

DOTFILES_ROOT=$(pwd -P)

set -e

echo ''


info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_zsh () {
  rm -rf $HOME/.antigen
  mkdir $HOME/.antigen
  cp antigen/bin/antigen.zsh $HOME/.antigen/antigen.zsh
  cp .zshrc $HOME/.zshrc
  cp .aliases.zsh $HOME/.aliases.zsh
}

setup_gitconfig() {
  # Skip this if we already have a gitconfig file.
  if ! [ -f git/gitconfig.local.symlink ]
  then
    info 'setup gitconfig'

    git_credential='cache'

    # If on Mac, then use osxkeychain to store git credentials.
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    # Find out some info for this user.
    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail
    user ' - What is your gpg signing key?'
    read -e gpg_signingkey

    # Use gitconfig.local.symlink.example as template
    # Add in user info that was just gathered.
    sed -e "s/AUTHORNAME/$git_authorname/g" \
        -e "s/AUTHOREMAIL/$git_authoremail/g" \
        -e "s/AUTHORGPGKEY/$gpg_signingkey/g" \
        -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
        git/gitconfig.local.symlink.example > \
        git/gitconfig.local.symlink

    success 'gitconfig'
  else
    info 'git already configured.'
  fi
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    info $src
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done
}

setup_gpg() {
  cp .gpg.zsh $HOME/.gpg.zsh
  cp -a .gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
  cp -a .gnupg/gpg.conf $HOME/.gnupg/gpg.conf
}

clone_dotfiles() {
  if ! [ -d $HOME/.dotfiles ]
  then
    git clone git@github.com:ryanjohnston/dotfiles.git ~/.dotfiles
    success "cloned git@github.com:ryanjohnston/dotfiles.git"
  else
    success "skipped git clone - folder exists"
  fi
}

#-------------------------------------------------------------

info 'updating dotfiles repo...'
clone_dotfiles

info 'configuring git:'
setup_gitconfig

info 'installing dotfiles...'
install_dotfiles

# If we're on a Mac, let's install and setup homebrew.

if [ "$(uname -s)" == "Darwin" ]
then
  info "installing dependencies"
  if source bin/dot | while read -r data; do info "$data"; done
  then
    success "dependencies installed"
  else
    fail "error installing dependencies"
  fi
fi

