#!/bin/bash

sudo apt update
sudo apt upgrade -y curl git zsh

# install poetry

curl -sSL https://install.python-poetry.org | python3 -

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc

# install nvm (node version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc

echo 'Run "nvm install --lts" to install Node.js'

source ~/.zshrc

# poetry tab completions
mkdir $ZSH/plugins/poetry
poetry completions zsh > $ZSH/plugins/poetry/_poetry

echo 'You must add poetry to your plugins array in ~/.zshrc to enable Poetry tab completions.'