source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle gpg-agent
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

antigen theme robbyrussell

source $HOME/.aliases.zsh
source $HOME/.gpg.zsh

antigen apply
