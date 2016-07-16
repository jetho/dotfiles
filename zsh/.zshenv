#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Nas
export NAS=/mnt/nas
export PUBLIC=$NAS/Public
export MULTIMEDIA=$NAS/Multimedia
export DOWNLOAD=$NAS/Download
export NASHOME=$NAS/home
export BACKUPS=$NAS/Backups

