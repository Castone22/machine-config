umask 022

if [[ $TERM == "dumb" ]]; then	# in emacs
    PS1='%(?..[%?])%!:%~%# '
    # for tramp to not hang, need the following. cf:
    # http://www.emacswiki.org/emacs/TrampMode
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
else
  # Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

  if [[ ! -e $ZSH ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  fi

  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # Optionally, if you set this to "random", it'll load a random theme each
  # time that oh-my-zsh is loaded.
  ZSH_THEME="robbyrussell"

  # Uncomment the following line to use case-sensitive completion.
  # CASE_SENSITIVE="true"

  # Uncomment the following line to disable bi-weekly auto-update checks.
  DISABLE_AUTO_UPDATE="true"

  # Uncomment the following line to change how often to auto-update (in days).
  export UPDATE_ZSH_DAYS=30

  # Uncomment the following line to disable colors in ls.
  # DISABLE_LS_COLORS="true"

  # Uncomment the following line to disable auto-setting terminal title.
  DISABLE_AUTO_TITLE="true"

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
  plugins=(git cabal debian history)

  source $ZSH/oh-my-zsh.sh
fi

### User configuration ###
export PATH=$HOME/bin:$HOME/local/bin:/usr/local/bin:$HOME/bin/idea/bin:$HOME/.cargo/bin:$PATH
export MANPATH=$HOME/local/share/man:"/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
setopt INTERACTIVE_COMMENTS

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR="$HOME/bin/ec-blocking"
  export ALTERNATE_EDITOR='nano'
fi

# Any extra bindirs?
if [[ -d $HOME/opt ]]; then
  for d in $HOME/opt/*(/N); do
    if [[ -d $d/bin ]]; then
      PATH=$d/bin:$PATH
    fi
  done
fi

# Keep ALL THE HISTORY
HISTSIZE=1073741824
SAVEHIST=1073741824
HISTFILE=~/.zsh_history
alias history='history -D'

if [[ -x ~/.zshrc_google ]]; then
  source ~/.zshrc_google
fi

## Aliases
# Pipes and stuff
alias -g gp='| grep -ei'

# Start MPD
pidof mpd > /dev/null || mpd ~/Music/mpd.conf

# Finalize
zstyle ':completion:*' use-cache on
compinit -u

fortune

#export KUBECONFIG=$HOME/kube/config.yaml
export GOPATH=$HOME/go
