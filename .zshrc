export ZSH=/usr/share/oh-my-zsh


ZSH_THEME="robbyrussell"

plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
$HOME/.local/share/java_nonreparenting_wm_hack.sh

# Defualt editor
export VISUAL=vim
export EDITOR="$VISUAL"

