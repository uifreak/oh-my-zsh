#!/bin/bash
  
brew install wget
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
RUNZSH=no sh install.sh
rm install.sh

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sed -i '.bak' 's/^plugins=(git).*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

sed -i '.bak' '/\source.*.oh-my-zsh.sh/i\
 ZSH_DISABLE_COMPFIX=true\
' ~/.zshrc

sed -i '.bak' 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

echo "Done"
