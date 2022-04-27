# Linux antigen file
source ~/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme
antigen theme romkatv/powerlevel10k

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle colorize
antigen bundle pip
antigen bundle python
antigen bundle colored-man-pages
antigen bundle debian
antigen bundle npm
antigen bundle rbenv

antigen bundle mattberther/zsh-pyenv

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle lukechilds/zsh-nvm

antigen apply

alias assume-role='function(){ eval $(/home/tim/programs/assume-role $@); }'
export PIPENV_VENV_IN_PROJECT=1