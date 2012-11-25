# i3-WM-config

My personal configuration for the i3 Window Manager. 


#### Install Instructions
<pre>
sudo apt-get install i3 thunar terminator dmenu conky feh
git clone git@github.com:jetho/i3-WM-config.git ~/.i3/
mv ~/.i3/terminator-config ~/.config/terminator/config
</pre>


#### Set Wallpaper
<pre>feh --bg-scale &lt;image&gt;</pre>


#### Set default terminal
<pre>sudo update-alternatives --config x-terminal-emulator</pre>


#### Enable password-less sudo for logout, reboot and shutdown
- insert the following lines into /etc/sudoers using visudo as root:
<pre>
User_alias SHUTDOWN=user1,user2,user3   # replace user1, user2 etc. with real user names
Cmnd_Alias HALT = /sbin/shutdown, /sbin/reboot, /usr/local/sbin/psadadmin
SHUTDOWN ALL= (ALL) NOPASSWD: HALT
</pre>


#### Additional key bindings available
- WIN + SHIFT + V => gvim
- WIN + I => default browser (configure default browser: "sudo update-alternatives --config x-www-browser")
- WIN + T => thunar
- WIN + SHIFT + S => Shutdown
