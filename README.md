# Ryan's Dot Files

## Overviews

# Hyper.js
- [Hyper.js Home](https://hyper.is/)
- [Awesome Hyper](https://github.com/bnb/awesome-hyper)

# ZSH
- [Awesome ZSH Plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [GitHub Topic:ZSH](https://github.com/search?utf8=%E2%9C%93&q=topic%3Azsh&type=)

## Commands

**GNUPG**

- ``keys`` - List GPG keys in gpg-agent
- ``publickey`` - Display public key in the console.
- ``privatekey`` - Display private key in the console.
- ``ec`` - Symmetric encrypt a file. Example: ec myfile.txt
- ``dc`` - Decrypt a file. Example: dc [ecnrypted file] [output]

**GIT**
- ``git lg`` - Display GIT history as tree graph.
- ``git lg1`` - Same but with more info.
- ``git lg2`` - Same but with more info.
- ``git lg3`` - Same but with more info.
- ``git l`` - View history of last 20 commits.
- ``git s`` - Status of current directory.
- ``git d`` - Show the diff between the last commit and the current state.
- ``git di #`` - Show the diff between the state (number) revisions ago and current. Example: git di 3
- ``git p`` - Pull in remote changes for the current repository and all submodules.
- ``git c`` - Clone a repo including all submodules. Example git c [url]
- ``git ca`` - Commit all changes
- ``git go`` - Switch to a new branch, creating it if necessary. Example: git go develop
- ``git tags`` - Show verbose output about tags.
- ``git branches`` - Show verbose output about branches.
- ``git remotes`` - Show verbose output about remotes
- ``git ammend`` - Ammend the currently staged files to the latest commit.
- ``git credit`` - Credit an author on the latest commit. Example: git credit Ryan ryanj@ryanj.org
- ``git reb`` - Interactive rebase with the given number of latest commits. Example: git reb 2
- ``git retag`` - Remove the old tag with this name and tag the latest commit with it. Example: git retag release
- ``git fb`` - Find branches containing a commit. Example: git fb [sha]
- ``git ft`` - Find tags containing a commit. Example: git ft [sha]
- ``git fc`` - Find commits by source code. Example: git fc [file name]
- ``git fm`` - Find commits by commit message. Exampe: git fm 'help'
- ``git dm`` - Remove all branches that have already been merged to master.
- ``git contributors`` - List contributors along with number of commits.
- ``git mpr`` - Merge GitHub pull request on top of master branch.

## Inspiration

- [pstadler/keybase-gpg-github](https://github.com/pstadler/keybase-gpg-github)
- [holman/dotfiles](https://github.com/holman/dotfiles)

## Required (with examples)

- GitHub User name: ryanjohnston
- GitHub Author email: ryanj@ryanj.org
- GPG Signing Key: 7DF2891B17435099
