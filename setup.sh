#!/bin/bash

cd

echo "Preparing environment .."
sudo apt-get update
sudo apt-get install git-core
git clone git://github.com/jetho/debian-and-xmonad-Config.git ~/setup_tmp

echo "Installing Software .."
sudo cp -Rf setup_tmp/apt/* /etc/apt/
sudo apt-get update
sudo apt-get install $(< setup_tmp/apps)
# install iceweasel from sid
sudo apt-get install -t unstable iceweasel

echo "Setting roxterm as default terminal emulator .."
sudo update-alternatives --set x-terminal-emulator /usr/bin/roxterm

echo "Installing Powerline .."
sudo apt-get install python-pip
pip install --user git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "Configuring ZSH and Prezto .."
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
zsh -c 'setopt EXTENDED_GLOB; 
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do 
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done'
chsh -s /bin/zsh

echo "Installing screenfetch .."
wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
chmod +x screenfetch
sudo mv screenfetch /usr/bin/

echo "Installing Tmuxinator .."
sudo gem install tmuxinator

echo "Pimping Vim .."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Installing basics for Haskell Dev .."
cabal update && cabal install hoogle && cabal install pointfree && cabal install hlint && cabal install hdevtools && cabal install lushtags && cabal install ghc-mod && cabal install stylish-haskell

echo "Applying personal configs .."
rsync -avh ~/setup_tmp/dotfiles/ ~
sudo chmod u+x ~/.xmonad/bin/*.sh
chmod u+x ~/bin/*.sh
sh .fehbg 
rm -R ~/setup_tmp

echo "Installing Vim Plugins .."
vim +BundleInstall +qall
cd ~/.vim/bundle/vimproc.vim
make
cd

echo "Setup finished! Please reboot!"

