#!/bin/bash

cd

echo "Installing Software .."
# install software
sudo apt-get update
sudo apt-get install `cat apps`

echo "Setting zsh as default shell .."
chsh -s `which zsh`    

echo "Setting urxvt as default terminal emulator .."
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt

echo "Pimping Vim .."
git clone git://github.com/jetho/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/vim-scripts/Wombat.git ~/.vim_runtime/sources_non_forked/wombat

echo "Oh my zsh!"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Preparing Vim for Scala Dev .."
DIR=~/.vim_runtime/sources_non_forked/vim-scala
mkdir -p $DIR/{ftdetect,indent,syntax,plugin} 
for d in ftdetect indent syntax ; do wget --no-check-certificate -O $DIR/$d/scala.vim https://raw.github.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim ;done
wget --no-check-certificate -O $DIR/plugin/31-create-scala.vim https://raw.github.com/scala/scala-dist/master/tool-support/src/vim/plugin/31-create-scala.vim

echo "Installing basics for Haskell Dev .."
cabal update && cabal install hoogle && cabal install pointfree && cabal install hlint 

echo "Applying personal configs .."
git clone git://github.com/jetho/debian-and-i3wm-Config.git ~/setup_tmp
rsync -avh ~/setup_tmp/dotfiles/ ~
sudo chmod u+x ~/.i3/*.sh
cd && sh .fehbg
rm -R ~/setup_tmp
echo "Setup finished! Please reboot!"
