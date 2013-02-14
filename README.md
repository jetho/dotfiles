# i3-WM-config

My personal configuration for the i3 Window Manager. 


#### Install Instructions
<pre>
sudo apt-get install i3 conky dzen2 thunar terminator dmenu ranger feh volumeicon-alsa zsh
git clone git@github.com:jetho/i3-WM-config.git ~/.i3/
mkdir -p ~/.config/terminator
mv ~/.i3/terminator-config ~/.config/terminator/config
chsh -s $(which zsh)    # set zsh as default shell
sudo chmod u+x ~/.i3/*.sh
</pre>


#### Set Wallpaper
<pre>feh --bg-scale &lt;image&gt;</pre>


#### Set default terminal emulator
<pre>sudo update-alternatives --config x-terminal-emulator</pre>


#### Pimp my zsh
<pre>
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
</pre>
Edit .zshrc to change the zsh theme. For example:
<pre>ZSH_THEME="tjkirch"</pre>
Here's a list of the available themes: https://github.com/robbyrussell/oh-my-zsh/wiki/themes


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
