export ZSH=/usr/share/oh-my-zsh


ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8


# Compilation flags
 export ARCHFLAGS="-arch x86_64"


# Dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Pywal, apply theme
(cat ~/.cache/wal/sequences &)

# Java hack
if  xset -q &>/dev/null; then
  # Check that an xserver is active
  $HOME/.local/share/java_nonreparenting_wm_hack.sh
fi

# Defualt editor
export VISUAL=vim
export EDITOR="$VISUAL"

alias pacmanbrowse="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

# Xilinx ISE
alias ise='/usr/bin/sh -c "unset LANG && unset QT_PLUGIN_PATH && source /opt/Xilinx/14.7/ISE_DS/settings64.sh && ise"'

# Cat fork w/ syntax highlighting
alias cat='bat -pP'

alias neofetch='neofetch --disable wm'

alias airplane-on='sudo rfkill block all'
alias airplane-off='sudo rfkill unblock all'

alias cninja='cmake -G Ninja'
