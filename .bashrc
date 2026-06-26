# .bashrc

# Global Enviorment Variables
export WGPU_VALIDATION=0 #For making Bevy not nuke the console

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export HISTCONTROL=ignorespace
export PATH
export PATH=$PATH:~/.cargo/bin/
export EDITOR=nvim

alias thanks='exit'

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#if [ -d ~/.bashrc.d ]; then
#    for rc in ~/.bashrc.d/*; do
#        if [ -f "$rc" ]; then
#            . "$rc"
#        fi
#    done
#fi
#unset rc
#. "/home/mpaule/.var/app/com.jetbrains.RustRover/data/cargo/env"
export VALGRIND_LIB=/usr/libexec/valgrind

alias doas="command sudo"
. "$HOME/.cargo/env"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/mpaule/.opam/opam-init/init.sh' && . '/home/mpaule/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration

