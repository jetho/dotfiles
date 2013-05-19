# i3wm-Config

My personal configuration for the i3 Window Manager. 


#### Install Instructions
<pre>
sudo apt-get install i3 conky dzen2 thunar rxvt-unicode dmenu ranger feh volumeicon-alsa zsh
git clone git@github.com:jetho/i3-WM-config.git ~/.i3/
cat ~/.i3/urxvt-config >> ~/.Xdefaults
chsh -s $(which zsh)    # set zsh as default shell
sudo chmod u+x ~/.i3/*.sh
rm -R ~/.i3/screenshots
</pre>


#### Disabling the nautilus desktop window
<pre>gsettings set org.gnome.desktop.background show-desktop-icons false</pre>


#### Set Wallpaper
<pre>feh --bg-scale &lt;image&gt;</pre>


#### Set default terminal emulator
<pre>sudo update-alternatives --config x-terminal-emulator</pre>


#### Pimp my zsh
<pre>
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
mv ~/.i3/zshrc ~/.zshrc
</pre>
Edit .zshrc to change the zsh theme. For example:
<pre>ZSH_THEME="bira"</pre>
Here's a list of the available themes: https://github.com/robbyrussell/oh-my-zsh/wiki/themes


#### Customizing Vim
<pre>
git clone git://github.com/jetho/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/vim-scripts/Wombat.git ~/.vim_runtime/sources_non_forked/wombat
mv ~/.i3/vim-config ~/.vim_runtime/my_configs.vim

# for Scala Dev
DIR=~/.vim_runtime/sources_non_forked/vim-scala
mkdir -p $DIR/{ftdetect,indent,syntax,plugin} 
for d in ftdetect indent syntax ; do wget --no-check-certificate -O $DIR/$d/scala.vim https://raw.github.com/scala/scala-dist/master/tool-support/src/vim/$d/scala.vim ;done
wget --no-check-certificate -O $DIR/plugin/31-create-scala.vim https://raw.github.com/scala/scala-dist/master/tool-support/src/vim/plugin/31-create-scala.vim
</pre>


#### Haskell Dev
<pre>
sudo apt-get install ghc7 cabal-install
cabal update && cabal install hoogle && cabal install pointfree && cabal install hlint 
mkdir -p ~/.ghc
mv ~/.i3/ghci.conf ~/.ghc/ghci.conf
</pre>


#### Enable password-less sudo for logout, reboot and shutdown
- insert the following lines into /etc/sudoers using visudo as root:
<pre>
# User alias specification
User_Alias HALT = user1, user2     # replace user1, user2 etc. with real user names
# Cmnd alias specification
Cmnd_Alias DOWN = /sbin/shutdown, /sbin/reboot
# User privilege specification
HALT ALL = NOPASSWD: DOWN
</pre>


#### Additional key bindings available
- WIN + SHIFT + V => gvim
- WIN + I => default browser (configure default browser: "sudo update-alternatives --config x-www-browser")
- WIN + T => ranger
- WIN + Shift + T => thunar
- WIN + SHIFT + S => Shutdown


#### Screenshots
[![empty desktop](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot1-th.png)](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot1.png)
[![two windows](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot2-th.png)](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot2.png)
[![three windows](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot3-th.png)](https://github.com/jetho/i3wm-Config/raw/master/screenshots/screenshot3.png)

