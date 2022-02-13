# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

# Change default editor
export EDITOR=micro

# Init stuff
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Terminal setup
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"
# Kubectl completion bash
source <(kubectl completion bash)

# Load aliases from separate file
. ~/.bash_aliases
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

