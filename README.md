## dotfiles

#### Install steps on a fresh Debian (Testing) machine

1. Install base software
<pre>
sudo apt-get update
sudo apt-get install git-core
git clone git://github.com/jetho/dotfiles.git ~/dotfiles
sudo cp -Rf ~/dotfiles/apt/* /etc/apt/
sudo apt-get update
sudo apt-get install -y $(< ~/dotfiles/apps)
# install iceweasel from sid
sudo apt-get install -y -t unstable iceweasel
</pre>

2. Set roxterm as default terminal emulator
<pre>
sudo update-alternatives --set x-terminal-emulator /usr/bin/roxterm
</pre>

3. Install Powerline
<pre>
sudo apt-get install -y python-pip
sudo pip install git+git://github.com/Lokaltog/powerline
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
</pre>

4. Install prezto
<pre>
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
</pre>

5. Set zsh as default shell
<pre>
chsh -s /bin/zsh
</pre>


6. Install screenfetch
<pre>
wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
chmod +x screenfetch
sudo mv screenfetch /usr/bin/
</pre>

7. Install Tmuxinator
<pre>
sudo gem install tmuxinator
</pre>

8. Stow dotfiles
<pre>
stow ~/dotfiles/zsh
stow ~/dotfiles/vim
stow ~/dotfiles/xmonad
stow ~/dotfiles/wallpaper
etc.
</pre>

9. Haskell-Vim-Now
<pre>
bash <(curl -sL http://git.io/haskell-vim-now)
cabal update && cabal install ghcid
</pre>

10. Set permissions
<pre>
sudo chmod u+x ~/.xmonad/bin/*.sh
chmod u+x ~/bin/*.sh
</pre>

11. Set Wallpaper
<pre>
sh ~/.fehbg 
</pre>

12. Enable password-less sudo for reboot, shutdown and network monitoring
- append the following lines to /etc/sudoers using "sudo visudo":
<pre>
# User alias specification
User_Alias      USERS  = user1, user2     # replace user1, user2 etc. with real user names
# Cmnd alias specification
Cmnd_Alias      SHUTDOWN = /sbin/shutdown, /sbin/reboot, /sbin/halt
Cmnd_Alias      MONITORING = /usr/sbin/iftop, /usr/sbin/iotop, /usr/sbin/nethogs
Cmnd_Alias      TAILS = /usr/bin/tail -f -n * /var/log/*
# User privilege specification
USERS ALL=(ALL) NOPASSWD: MONITORING, SHUTDOWN, TAILS
</pre>



#### Favorite Firefox Add-ons
- [uBlock Origin](https://addons.mozilla.org/pt-br/firefox/addon/ublock-origin/)
- [HTTPS Everywhere](https://www.eff.org/https-everywhere)
- [Privacy Badger](https://addons.mozilla.org/pt-br/firefox/addon/privacy-badger-firefox/)
- [Self Destruction Cookies](https://addons.mozilla.org/pt-br/firefox/addon/self-destructing-cookies/)
- [NoScript](https://addons.mozilla.org/en-us/firefox/addon/noscript/)
- [Random Agent Spoofer](https://addons.mozilla.org/pt-br/firefox/addon/random-agent-spoofer/)
- [Tree Style Tab](https://addons.mozilla.org/pt-br/firefox/addon/tree-style-tab/)
- [Vimperator](https://addons.mozilla.org/en-us/firefox/addon/vimperator/)
- [NumberedTabs](https://addons.mozilla.org/En-us/firefox/addon/numberedtabs/)
- [Omnibar](https://addons.mozilla.org/en-us/firefox/addon/omnibar/)
- [Tile Tabs](https://addons.mozilla.org/en-us/firefox/addon/tile-tabs/)
- [GreaseMonkey](https://addons.mozilla.org/en-us/firefox/addon/greasemonkey/)
- [DownThemAll!](https://addons.mozilla.org/en-us/firefox/addon/downthemall/)
- [Session Manager](https://addons.mozilla.org/en-us/firefox/addon/session-manager/)
- [Send to XBMC/Kodi](https://addons.mozilla.org/en-US/firefox/addon/send-to-xbmc/)
- [Stylus Blue](https://addons.mozilla.org/de/firefox/addon/stylus-blue/)



#### Screenshots

[![clean](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/clean.png)
[![dev](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/dev.png)
[![sys](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys_th.png)](https://raw.github.com/jetho/debian-and-xmonad-Config/master/screenshots/sys.png)
