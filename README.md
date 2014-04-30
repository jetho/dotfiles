## debian-and-xmonad-Config

My workstation setup with Debian (Testing) and the XMonad Window Manager. 

#### Installing a minimal Debian System
Use the Debian Netinstall ISO for installing a minimal Debian System: http://www.debian.org/distrib/netinst

Install only the "Standard System Utilities" and "Laptop" if needed!

#### Setup Script (see setup.sh)
```bash
#!/bin/bash

cd

echo "Installing Software .."
echo "deb http://cdn.debian.net/debian unstable main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install $(< apps)
# install iceweasel from sid
sudo apt-get install -t unstable iceweasel

echo "Setting zsh as default shell .."
chsh -s `which zsh`

echo "Setting urxvt as default terminal emulator .."
sudo update-alternatives --set x-terminal-emulator /usr/bin/urxvt

echo "Getting patched font for Powerline .."
wget https://github.com/Lokaltog/powerline-fonts/raw/master/Inconsolata/Inconsolata%20for%20Powerline.otf
sudo mv "Inconsolata for Powerline.otf" /usr/share/fonts
sudo fc-cache -vf

echo "Pimping Vim .."
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "Oh my zsh!"
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
mkdir -p ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Installing basics for Haskell Dev .."
cabal update && cabal install hoogle && cabal install pointfree && cabal install hlint && cabal install hdevtools

echo "Applying personal configs .."
git clone git://github.com/jetho/debian-and-xmonad-Config.git ~/setup_tmp
rsync -avh ~/setup_tmp/dotfiles/ ~
sudo chmod u+x ~/.xmonad/bin/*.sh
cd && sh .fehbg 
rm -R ~/setup_tmp

echo "Installing Vim Plugins .."
vim +BundleInstall +qall

echo "Setup finished! Please reboot!"
 ```

#### Enable password-less sudo for reboot, shutdown and network monitoring
- append the following lines to /etc/sudoers using "sudo visudo":
<pre>
# User alias specification
User_Alias      USERS  = user1, user2     # replace user1, user2 etc. with real user names
# Cmnd alias specification
Cmnd_Alias      SHUTDOWN = /sbin/shutdown, /sbin/reboot, /sbin/halt
Cmnd_Alias      MONITORING = /usr/sbin/iftop, /usr/sbin/iotop, /usr/sbin/nethogs
# User privilege specification
USERS ALL=(ALL) NOPASSWD: MONITORING, SHUTDOWN
</pre>


#### Scheduled Syncing with Unison
- exec "crontab -e" and add the following line:
<pre>
0 * * * * /usr/bin/flock -n /tmp/unison.lockfile unison -ui text unison
</pre>


#### Favorite Firefox Add-ons
- [HTTPS Everywhere](https://www.eff.org/https-everywhere)
- [Adblock Edge](https://addons.mozilla.org/en-us/firefox/addon/adblock-edge/)
- [Omnibar](https://addons.mozilla.org/en-us/firefox/addon/omnibar/)
- [Disconnect](https://disconnect.me/)
- [RequestPolicy](https://addons.mozilla.org/en-us/firefox/addon/requestpolicy/)
- [NoScript](https://addons.mozilla.org/en-us/firefox/addon/noscript/)
- [Vimperator](https://addons.mozilla.org/en-us/firefox/addon/vimperator/)
- [Custom Tab Width](https://addons.mozilla.org/en-us/firefox/addon/custom-tab-width/)
- [Tile Tabs](https://addons.mozilla.org/en-us/firefox/addon/tile-tabs/)
- [GreaseMonkey](https://addons.mozilla.org/en-us/firefox/addon/greasemonkey/)
- [Pocket](https://addons.mozilla.org/en-us/firefox/addon/read-it-later/)
- [DownThemAll!](https://addons.mozilla.org/en-us/firefox/addon/downthemall/)
- [Session Manager](https://addons.mozilla.org/en-us/firefox/addon/session-manager/)
- [BetterPrivacy](https://addons.mozilla.org/en-us/firefox/addon/betterprivacy/)
- [FT DeepDark](https://addons.mozilla.org/de/firefox/addon/ft-deepdark/)

#### Additional key bindings available
- WIN + p => dmenu
- WIN + t => tmux
- WIN + v => vim
- WIN + SHIFT + v => gvim
- WIN + i => firefox
- WIN + r => ranger
- WIN + SHIFT + t => thunar
- WIN + SHIFT + s => Shutdown
- WIN + PageUp/PageDown => ncmpcpp Volume Up/Down
- Print => create screenshot and save into ~/Pictures

#### Screenshots

[![clean](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean.png)
[![dev](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev.png)
[![sys](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys.png)
