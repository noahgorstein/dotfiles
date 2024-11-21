DOTFILE_PATH := $(shell pwd)

# targets
STARSHIP := $(HOME)/.starship.toml
ZSH := $(HOME)/.zshrc
TMUX := $(HOME)/.tmux.conf
ALACRITTY := $(HOME)/.alacritty.toml
KITTY = $(HOME)/.config/kitty
GHOSTTY = $(HOME)/.config/ghostty
NEOVIM := $(HOME)/.config/nvim

default: help
.PHONY: help
help: ## Print this help.
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-30s\033[0m %s\n", $$1, $$2}' | sort

$(STARSHIP): starship.toml
	ln -sf $(DOTFILE_PATH)/starship.toml $@

$(ZSH): zshrc
	ln -sf $(DOTFILE_PATH)/zshrc $@

$(TMUX): tmux.conf
	ln -sf $(DOTFILE_PATH)/tmux.conf $@

$(ALACRITTY): alacritty.toml
	ln -sf $(DOTFILE_PATH)/alacritty.toml $@

$(KITTY): kitty 
	ln -sf $(DOTFILE_PATH)/kitty $@

$(GHOSTTY): ghostty
	ln -sf $(DOTFILE_PATH)/ghostty $@

$(NEOVIM): nvim
	ln -sf $(DOTFILE_PATH)/nvim $@

all: $(STARSHIP) $(ZSH) $(TMUX) $(ALACRITTY) $(KITTY) $(GHOSTTY) $(NEOVIM) ## Setup all of the files as symlinks in your home directory.

.PHONY: clean
clean: ## Remove all symlinks originating from dotfiles repo
	rm -r -I $(STARSHIP) $(ZSH) $(TMUX) $(ALACRITTY) $(KITTY) $(GHOSTTY) $(NEOVIM)


