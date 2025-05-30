#############
## PRIVATE ##
#############

# Include private stuff that's not supposed to show up
# in the dotfiles repo
local private="${HOME}/private.sh"
if [ -e ${private} ]; then
  . ${private}
fi

###########
# ENV
###########

typeset -U PATH
autoload colors; colors;

export EDITOR="nvim"
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export KEYTIMEOUT=1

# python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# java
# export JAVA_HOME="/opt/homebrew/Cellar/openjdk@11/11.0.12/libexec/openjdk.jdk/Contents/Home"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home

# fzf
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# rust
source "$HOME/.cargo/env"

export PATH=$HOME/.local/bin:$PATH 

# trim newlines when pasting
bracketed-paste() {
  zle .$WIDGET && LBUFFER=${LBUFFER%$'\n'}
}
zle -N bracketed-paste

############
# ALIASES
############

alias ll="ls -lah"
alias reload="source ~/.zshrc"
alias vim="nvim"
alias projects="cd ~/projects"
alias stredit=": | vipe | cat -"

alias gs="git status"
alias ga="git add"
alias gc="git commit"

# tmux
alias tma='tmux attach -t'
alias tmn='tmux new -s'

# stardog
alias start='stardog-admin server start'
alias stop='stardog-admin server stop'

# docker
alias rm-dang='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-nuke='docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume prune -f'

# terraform
alias tf='terraform'

#############
# HISTORY
#############

HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt INC_APPEND_HISTORY     # Immediately append to history file.
setopt EXTENDED_HISTORY       # Record timestamp in history.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Dont record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Dont record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Dont write duplicate entries in the history file.
setopt SHARE_HISTORY          # Share history between all sessions.
unsetopt HIST_VERIFY          # Execute commands using history (e.g.: using !$) immediately

#############
# COMPLETION
#############

# Add completions installed through Homebrew packages
# See: https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# unsetopt menucomplete
unsetopt flowcontrol
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt auto_pushd

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

###############
# KEYBINDINGS
################

# Vim Keybindings
bindkey -v

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

###########
# STARDOG
###########
export STARDOG_HOME="$HOME/stardog-home"
export STARDOG_EXT="$HOME/stardog-ext"

####################
# STARSHIP PROMPT
####################
export STARSHIP_CONFIG=$HOME/.starship.toml
eval "$(starship init zsh)"

#################
# FUNCTIONS
#################

# fbd - delete git branch interactively 
function fbd {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf --multi ) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# turn mov into gif
function makegif {
  ffmpeg -y -i $1 -vf fps=30,scale=1040:-1:flags=lanczos,palettegen palette.png
  ffmpeg -y -i $1 -i palette.png -filter_complex "fps=30,scale=1040:-1:flags=lanczos[x];[x][1:v]paletteuse" $1.gif
}


HASH="%C(always,yellow)%h%C(always,reset)"
RELATIVE_TIME="%C(always,green)%ar%C(always,reset)"
AUTHOR="%C(always,bold blue)%an%C(always,reset)"
REFS="%C(always,red)%d%C(always,reset)"
SUBJECT="%s"

FORMAT="$HASH $RELATIVE_TIME{$AUTHOR{$REFS $SUBJECT"

pretty_git_log() {
  git log --graph --pretty="tformat:$FORMAT" $* |
  column -t -s '{' |
  less -XRS --quit-if-one-screen
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [[ "$(uname)" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  source /usr/share/doc/fzf/examples/key-bindings.zsh

  if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add $HOME/.ssh/id_ed25519
  fi

fi

#######################
# ALACRITTY
#######################
if [ "$ALACRITTY" = "true" ]
then
  theme() {
    ln -sf $HOME/.config/alacritty/themes/themes/$1.toml $HOME/.config/alacritty/active.toml
  }
  local ALACRITTY_THEME=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")
  if [ "$ALACRITTY_THEME" = "Dark" ]
  then
    theme "kanagawa_wave"
  else
    theme "catppuccin_latte"
  fi
fi


######################
# KITTY
######################
kitty-reload() {
    kill -SIGUSR1 $(pidof kitty)
}


# HUGGINGFACE
export TRANSFORMERS_NO_ADVISORY_WARNINGS=1
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
. "/Users/noah/.deno/env"
