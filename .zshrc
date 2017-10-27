# Path to your oh-my-zsh installation.
export ZSH=/home/mike/.oh-my-zsh

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
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_BATTERY_ICON=$'\u26A1'
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_VERBOSE=false

function cleanTimesheet() {
    file="$1"
    if [[ ! -e "$file"  ]]
    then
        echo "File does not exist."
        return 1
    fi

    sed -r 's/^ +$//g' "$file" -i
    sed -r 's/\t/ /g' "$file" -i
    sed -r 's/ +/ /g' "$file" -i
    sed -r 's/ +$//g' "$file" -i
}

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
source ~/.nix-profile/etc/profile.d/nix.sh
source $ZSH/oh-my-zsh.sh

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
alias gc="git commit -v"
alias standup="g lg | ag 'hours' --nocolor"
alias lastweek="g lg | ag '(hours)|([1-7] days)' --nocolor"

alias dev="git checkout develop"
alias pages="git checkout gh-pages"

alias tree="tree -C"

# PHP aliases
alias php56="/home/mike/opt/php-5.6.29/bin/php"

# composer aliases
alias co="php -n /home/mike/opt/composer"
alias coi="php -n /home/mike/opt/composer install"
alias cou="php -n /home/mike/opt/composer update"

alias c=clear
alias ccat='pygmentize -O style=monokai -f console256 -g'

# dePHPend aliases

alias de="php -n /home/mike/workspace/dephpend/bin/dephpend"

# php aliases
alias php71=/home/mike/opt/php-7.1/bin/php
alias p=phpunit
alias pcov="phpunit --coverage-text --colors"

alias m=make

alias server="ssh root@78.47.124.92"
alias kodi="ssh 'osmc@192.168.1.106'"

# folder aliases
alias dl="cd /home/mike/Downloads/"
alias work="/home/mike/workspace/"
alias mvi="cd /home/mike/Dropbox/Documents/Studies/MA\ Ro/MVI2/Uebungen/"
alias ma="cd /home/mike/Dropbox/Documents/Studies/MA\ Ro/Master\ Arbeit/"
alias ms="cd /home/mike/Dropbox/Documents/Studies/MA\ Ro/Master\ Seminar/"
alias sti="cd /home/mike/Dropbox/Documents/Studies/MA\ Ro/STI/"

alias weather="curl -4 http://wttr.in/Munich"
alias xclip="xclip -selection c"
alias xpaste="xclip -o"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

export JDK_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.111-1.b16.fc23.x86_64"
export JAVA_HOME=$JDK_HOME
export GRADLE_HOME=/usr/share/gradle
export GOROOT="/home/mike/opt/go"
export GOPATH="/home/mike/.go"
export PATH=$PATH:/home/mike/bin:/usr/local/go/bin:/usr/local/php7.0.0/bin/:/home/mike/opt/anaconda3/bin:/home/mike/.composer/vendor/bin:/home/mike/opt/php7/bin:$GOROOT/bin:$HOME/.yarn/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mike/.sdkman"
[[ -s "/home/mike/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mike/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/home/mike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

