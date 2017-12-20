# Path to your oh-my-zsh installation.
export ZSH=/Users/torstenschmickler/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
export PATH=/usr/local/bin:$PATH
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# User configuration

export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/sbin:$PATH # homebrew
export PATH=~/bin:$PATH # user scripts
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source /usr/local/etc/profile.d/z.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
SAVEHIST=1000
HISTFILE=~/.zsh_history

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
setopt inc_append_history
setopt share_history

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#source zsh-history-substring-search.zsh
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias corelog='tail -f log/`date '+%Y-%m-%d'`.core.log'
alias frontlog='tail -f log/`date '+%Y-%m-%d'`.front.log'
alias sandbox='ssh sandbox-backend'
alias staging-a='ssh staging-backend-a'
alias staging-b='ssh staging-backend-b'
alias pro-a='ssh production-backend-a'
alias pro-b='ssh production-backend-b'
alias migrateNode='NODE_ENV=development node_modules/.bin/sequelize db:migrate'
alias stopback='kill -9 `cat /Users/torstenschmickler/Documents/workspace/Veriff/back/tmp/pids/server.pid`'
alias back='z back; rails s -d'
alias front='z front; pm2 start bin/www --name front --watch;'
alias core='z core;  pm2 start bin/www --name core --watch;'
alias demo='z demo; pm2 start bin/www --name demo --watch;'
alias develop='back; front; core; demo;'
alias stopdevelop='killrails; pm2 stop all;'
alias vag='ssh -p 2222 apps@localhost'
alias whitelist-staging='aws ec2 authorize-security-group-ingress --group-id sg-2ec6c849  --protocol tcp --port 22 --cidr $(curl ifconfig.co)/32 | echo $(curl ifconfig.co) >> ~/whitelisted.txt'
alias whitelist-staging-db='aws ec2 authorize-security-group-ingress --group-id sg-ef697c88  --protocol  tcp --port 5432 --cidr $(curl ifconfig.co)/32 | echo $(curl ifconfig.co) >> ~/whitelisted.txt'
alias whitelist-production='aws ec2 authorize-security-group-ingress --group-id sg-1bc6c87c --protocol  tcp --port 22 --cidr $(curl ifconfig.co)/32 | echo $(curl ifconfig.co) >> ~/whitelisted.txt'
alias whitelist-production-db='aws ec2 authorize-security-group-ingress --group-id sg-de697cb9 --protocol  tcp --port 5432 --cidr $(curl ifconfig.co)/32 | echo $(curl ifconfig.co) >> ~/whitelisted.txt'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
