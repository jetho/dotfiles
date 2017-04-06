## dotfiles

#### Install steps on a fresh Debian (Testing) machine

1. Install base software

    ```bash
    sudo apt-get update
    sudo apt-get install git-core stow
    git clone git://github.com/jetho/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    sudo stow -t / etc
    sudo apt-get update
    sudo apt-get install -y $(< ~/dotfiles/apps)
    # install iceweasel from sid
    sudo apt-get install -y -t unstable iceweasel
    ```

2. Set xfce4-terminal as default terminal emulator

    ```bash
    sudo update-alternatives --set x-terminal-emulator /usr/bin/xfce4-terminal.wrapper
    ```

3. Install Powerline

    ```bash
    sudo apt-get install -y python-pip
    sudo pip install git+git://github.com/Lokaltog/powerline
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
    wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    sudo mv PowerlineSymbols.otf /usr/share/fonts/
    sudo fc-cache -vf
    sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
    ```

4. Install prezto

    ```bash
    git clone --recursive https://github.com/sorin-ionescu/prezto.git ~/.zprezto
    ```

5. Install fasd

    ```bash
    git clone git@github.com:clvv/fasd.git
    sudo make -C fasd install
    rm -Rf fasd
    ```

6. Install fzf
    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```

7. Set zsh as default shell

    ```bash
    chsh -s /bin/zsh
    ```

8. Install screenfetch

    ```bash
    wget -O screenfetch 'https://raw.github.com/KittyKatt/screenFetch/master/screenfetch-dev'
    chmod +x screenfetch
    sudo mv screenfetch /usr/bin/
    ```

9. Install Tmuxinator

    ```bash
    sudo gem install tmuxinator
    ```

10. Stow dotfiles

    ```bash
    cd ~/dotfiles
    stow $(ls -d ^etc(/))
    ```

11. Haskell Tools (optional)

    ```bash
    curl -sSL https://get.haskellstack.org/ | sh
    stack install ghc-mod hlint hasktags codex hscope pointfree pointful hoogle hindent apply-refact
    ```

12. Set permissions

    ```bash
    sudo chmod u+x ~/.xmonad/bin/*.sh
    chmod u+x ~/bin/*.sh
    ```

13. Set Wallpaper

    ```bash
    sh ~/.fehbg 
    ```

14. Enable password-less sudo for reboot, shutdown and network monitoring

Append the following lines to /etc/sudoers using "sudo visudo":

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
