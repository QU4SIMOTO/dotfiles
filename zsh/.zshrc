export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

plugins=(
	git 
	node 
	npm 
	github 
	zsh-syntax-highlighting 
	zsh-autosuggestions 
	git-open
)
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR=nvim

alias s="source ~/.zshrc"
alias mux=tmuxinator
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias python=python3
alias cr="cargo run"
alias ct="cargo test"
alias cck="cargo check"
alias vi="nvim"

VULKAN_SDK=$HOME/VulkanSDK/1.3.211.0/macOS
DYLD_FALLBACK_LIBRARY_PATH=$VULKAN_SDK/lib
VK_ICD_FILENAMES=$VULKAN_SDK/share/vulkan/icd.d/MoltenVK_icd.json
VK_LAYER_PATH=$VULKAN_SDK/share/vulkan/explicit_layer.d

# opam configuration
[[ ! -r /Users/jackdixon/.opam/opam-init/init.zsh ]] || source /Users/jackdixon/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# use vim mode
set -o vi
bindkey -M viins 'jk' vi-cmd-mode
export KEYTIMEOUT=30

# use ESC to edit the current command
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\033' edit-command-line

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
