# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
unsetopt correct_all
setopt correct # only correct commands, not args

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

export ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}["
export ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
PS1=$'%{$fg[blue]%}┌─%{$fg[magenta]%}%n@%m%{$fg[green]%}[%c]$(git_prompt_info)%{$reset_color%}\n %{$fg[blue]%}└─ λ%{$reset_color%} '
#PS1=$'%{$fg[blue]%}──%{$fg[magenta]%}%m%{$fg[green]%}[%c]%{$reset_color%}$(git_prompt_info) %{$fg[blue]%}λ%{$reset_color%} '

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'
export TERM='screen-256color'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export GL_ENABLE_DEBUG_ATTACH=YES

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# put ~/bin on PATH if you have it
test -d "$HOME/bin" &&
PATH="$HOME/bin:$PATH"

export GOPATH="$HOME/src/go"
export PATH="${GOPATH//://bin:}/bin:$PATH"


export PATH="$HOME/src/moon/bin:$PATH"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export LSCOLORS=""
alias ls='ls -G'      # colorized ls
alias grep='grep -G'  # colorized grep
alias mm='middleman'

alias vim='nvim'
alias v='nvim'
alias vim='echo'

alias g='/usr/local/bin/git'
alias git='echo'

alias k='kubectl'
alias h='helm'
alias f='fly -t ci'

# OSX is turning into shit, askpass isn't working so I copied it from
# https://github.com/markcarver/mac-ssh-askpass/blob/master/ssh-askpass
# into ~/bin/ssh-askpass
export SSH_ASKPASS="ssh-askpass"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fzf-down() {
  fzf --height 50% "$@" --border
}

gh() {
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

zle -N gh
bindkey '^g^h' gh

# erlang shell history
export ERL_AFLAGS="-kernel shell_history enabled"
export ELIXIR_EDITOR="vi +__LINE__ __FILE__"

# autocomplete kubectl
source <(kubectl completion zsh)

export PATH="$HOME/.yarn/bin:$PATH"
