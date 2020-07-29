# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#if [ -f `which powerline-daemon`  ]; then
#    powerline-daemon -q
#    POWERLINE_BASH_CONTINUATION=1
#    POWERLINE_BASH_SELECT=1
#    . /usr/share/powerline/zsh/powerline.zsh
#fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export TERM="xterm-256color"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_VCS_SHORTEN_LENGTH=30
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=10
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_COLOR_SCHEME='dark'
#POWERLEVEL9K_BATTERY_ICON=$'\u26A1'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
DEFAULT_USER=mike

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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

plugins=(
    git
    zsh-syntax-highlighting
    phing
    npm
    vagrant
    colored-man-pages
    docker
    yarn
    npm
    mvn
    zsh-autosuggestions
)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source $ZSH/oh-my-zsh.sh

source /usr/share/autojump/autojump.sh

function current-branch() {
   git branch | grep '*' | cut -d' ' -f2 | xclip
}

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# git aliases
alias g=git
alias gs="git status"
alias gf="git fuzzy"
alias gc="git commit -v"
alias standup="g lg | ag 'hours' --nocolor"
alias lastweek="g lg | ag '(hours)|([1-7] days)' --nocolor"

alias wifi="nmcli d wifi list"

alias vi="nvim"
alias tree="exa --tree"
alias le="exa -al"
alias t="todo-txt"
alias keysync="$HOME/.gnupg/keysync.sh"

alias c=clear
alias ccat='pygmentize -O style=monokai -f console256 -g'

# php aliases
alias coi="find_composer install"
alias cou="find_composer update"
alias p=phpunit
alias pcov="phpunit --coverage-text --colors"

alias m=make

# folder aliases
alias dl="cd $HOME/Downloads/"
alias work="$HOME/workspace/"

alias weather="curl -4 http://wttr.in/Munich"
alias xclip="xclip -selection c"
alias xpaste="xclip -o"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

alias bat="bat --theme=Monokai\ Extended\ Light"

# functions
source "$HOME/dotfiles/scripts/tng"
source "$HOME/dotfiles/scripts/helpers"
source "$HOME/dotfiles/scripts/clone"
source "$HOME/dotfiles/scripts/mkcd"

export PATH=$PATH:$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:$HOME/.composer/vendor/bin:$GOROOT/bin:$HOME/.yarn/bin:$HOME/.cargo/bin:$HOME/.rbenv/bin:$HOME/opt/git-fuzzy/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /home/mike/.travis/travis.sh ] && source /home/mike/.travis/travis.sh

if [ type rbenv >/dev/null 2>&1 ]; then
    eval "$(rbenv init -)"
    # sets RBENV_VERSION to the latest version of ruby
    rbenv shell $(rbenv versions | tail -n1 | sed 's/*//')
fi

export PHPENV_ROOT="${HOME}/.phpenv"
if [ -d "${PHPENV_ROOT}" ]; then
    export PATH="${PHPENV_ROOT}/bin:${PATH}"
    eval "$(phpenv init -)"
    phpenv shell $(phpenv versions | tail -n1) >/dev/null 2>&1
fi


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mike/.sdkman"
[[ -s "/home/mike/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mike/.sdkman/bin/sdkman-init.sh"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/sls.zsh ]] && . /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/slss.zsh ]] && . /home/mike/workspace/mercateo/unite-graphql/node_modules/tabtab/.completions/slss.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/mike/opt/terraform terraform
