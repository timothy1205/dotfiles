export ZSH=/usr/share/oh-my-zsh


ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose history yarn vundle thefuck)

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
alias dfst='dotfiles status'
alias dfa='dotfiles add'
alias dfmsg='dotfiles commit -m'
alias dfp='dotfiles push'
alias dflog='dotfiles log --oneline --decorate --graph'
alias dfsps='dotfiles show --pretty=short --show-signature'
alias dfd='dotfiles diff'


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

# Cat fork w/ syntax highlighting
alias cat='bat -pP'

alias cninja='cmake -G Ninja'

alias ncdu='ncdu --color dark'

function trizen () {
  if [ $# -eq 0 ]
  then
    /usr/bin/trizen -Syu
    /usr/bin/flatpak update
  else
    /usr/bin/trizen "$@"
  fi
}

export THEFUCK_EXCLUDE_RULES='fix_file'

[[ -r "/usr/share/z/z.sh"  ]] && source /usr/share/z/z.sh


function lxc-update-all () {
  for remote_line in `lxc remote ls --format csv`;
  do
    if [ $(echo $remote_line | cut -d',' -f3) != 'lxd' ]; then
      continue
    fi

    remote=$(echo $remote_line | cut -d',' -f1)
    if [ $remote = '(current)' ]; then
      remote='local'
    fi

    for container in `lxc ls $remote: volatile.last_state.power=RUNNING -c n --format csv`;
    do 
      echo "\n\n===========================
  updating $remote:$container
===========================\n\n"
      lxc exec $remote:$container -- sh -c "if [ -f /usr/bin/pacman ]; then /usr/bin/pacman -Syu --noconfirm; elif [ -f /usr/bin/apt-get ]; then /usr/bin/apt-get update && /usr/bin/apt-get upgrade -y; fi"; 
    done
  done
}

function lxc-restart-all () {
  for remote_line in `lxc remote ls --format csv`;
  do
    if [ $(echo $remote_line | cut -d',' -f3) != 'lxd' ]; then
      continue
    fi

    remote=$(echo $remote_line | cut -d',' -f1)
    if [ $remote = '(current)' ]; then
      remote='local'
    fi

    echo "Restarting $remote containers..."
    lxc restart $remote: --all
  done
}

source /usr/share/nvm/init-nvm.sh
