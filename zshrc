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

# js
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# java
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@11/11.0.12/libexec/openjdk.jdk/Contents/Home"

# go 
export GOPATH=$HOME/go
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.local/bin:$PATH 

############
# ALIASES
############

alias reload="source ~/.zshrc"
alias vim="nvim"
alias projects="cd ~/projects"

# tmux
alias tma='tmux attach -t'
alias tmn='tmux new -s'

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


