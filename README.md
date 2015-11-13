## dotfiles

My workstation setup with Debian (Testing) and the XMonad Window Manager. 

#### Installing a minimal Debian System
- Get the Debian Netinstall Image: https://www.debian.org/devel/debian-installer/
- Choose "Advanced Options" -> "Expert Install"
- Disable root login
- Install only the "Standard System Utilities"!

#### Setup
<pre>
cd
wget https://raw.githubusercontent.com/jetho/debian-and-xmonad-Config/master/setup.sh
chmod u+x setup.sh
./setup.sh
</pre>

#### Enable password-less sudo for reboot, shutdown and network monitoring
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
