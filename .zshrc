# Path to your oh-my-zsh configuration.
ZSH=/Users/freax/.dotfiles/zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
#ZSH_THEME="remy"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump brew git-extras git-flow git-flow-avh git git-hubflow git-remote-branch gitfast github gitignore git-prompt history history-substring-search osx perl pip pyenv python repo rsync screen sublime sudo systemd textmate themes tmux tmuxinator torrent urltools vagrant vundle web-search xcode)
#plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# User configuration
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# All aliases
# Homebrew aliases
alias install='brew install'
alias uninstall='brew uninstall'
alias search='brew search'
alias update='brew update'
alias upgrade='brew upgrade'
alias tap='brew tap'
alias untap='brew untap'
alias link='brew link'
alias unlink='brew unlink'
alias doctor='brew doctor'

alias la='ls -a'
alias ll='ls -l'
alias lr='ls -lrt'
alias lt='ls -lt | sort -r'
alias lh='ls -lth | head -10'
alias ldir='ls -d */'

# Directory-related
alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias slogs='cd /Users/freax/STARFISH/StarControl/StarControl.app/Contents/Resources/logs'

# text processing aliases
alias rmcr='perl -p -i -e '\''s/\r//g'\''' #remove carriage return

alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Gradle commands
alias gbuild='gradle build'
alias gl='gradle'
alias gclean='gradle clean'

# coordinate conversion
alias xylatlong='python /Users/freax/tests/xyLatLong.py'

# Gradle related
GRADLE_HOME=/Users/freax/gradle-1.11
export GRADLE_HOME
export PATH=$PATH:$GRADLE_HOME/bin
export PATH=$PATH:/usr/local/groovy/groovy-2.3.3/bin

# For ROS
export PATH=/usr/local/bin:$PATH
source ~/ros_catkin_ws/install_isolated/setup.zsh
#source ~/bbauv/devel/setup.zsh
#export ROS_IP=192.168.1.170
export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://localhost:11311
export PATH=/Users/freax/ros_catkin_ws/install_isolated/bin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Users/freax/gradle-1.11/bin:/usr/local/groovy/groovy-2.3.3/bin:/usr/lib

# For Golang
export PATH=$PATH:/usr/local/go/bin

# For RabbitMQ
export PATH=$PATH:/usr/local/sbin

# Other exports
export EDITOR=/usr/local/Cellar/macvim/7.4-74/bin/mvim

# custom functions
# Add number of pomodoro hours achieved for a given date
pmdoro() {
  echo "$(date +%d%m%Y) $@" >> /Users/freax/mychart.txt
}

# Adding authentication keys onto a remote machine
add_auth_key() {
  ssh-copy-id $@
}

# Epoch time to human readable time
epoch_to_human() {
  date -j -f %s $@
}

# Human readable time in hhmmss to epoch
human_to_epoch() {
  python /Users/freax/scripts/human_to_epoch.py $@
}

# Extract different types of archives
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Kills any process that matches a regexp passed to it
killit() {
  ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# kill StarControl
killstar() {
  sudo kill -9  `ps aux | grep '[S]tarControl' | awk '{print $2}'`
}

# Convert DOS formatted files (carriage return + linefeed for newline \r\n)
# to Unix format (only linefeed \n)
dos2unix() {
  sed -e 's/\r//' $@ > $@
}

# gather external ip address
exip() {
    echo -n "Current External IP: "
    curl -s -m 5 http://myip.dk | grep "ha4" | sed -e 's/.*ha4">//g' -e 's/<\/span>.*//g'
}

# determine local IP address
ips() {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

# Print the shell
shell() {
  ps | grep `echo $$` | awk '{ print $4 }'
}

# grep for a case-insensitive pattern search in a directory
mgrep() {
  grep -ir $@ ./
}

# substituting one string with another in a file regex
# Usage: replace src_string target_string file_regex
replace () {
  perl -i -p -e "s/$1/$2/g" $3
}

# tmux killing all the sessions, detached or undetached
tmuxkill() {
  tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}
}


#THIS MUST BE AT THE END OF THE FILE FOR GVM (Groovy SDK manager) TO WORK
#[[ -s "/Users/freax/.gvm/bin/gvm-init.sh" ]] && source "/Users/freax/.gvm/bin/gvm-init.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
