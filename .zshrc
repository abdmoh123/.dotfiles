# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Use emacs mode
bindkey -e
# Enable CTRL-LEFT and CTRL-RIGHT word navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/var/home/abdha/.zshrc'

# Enable zsh basic auto-complete (tabs)
# Must be before setting up zoxide
autoload -Uz compinit
compinit

# Load version control info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '[%b ]'

# Declare/initialise empty value for prompt
PS1=''

# Exclusive to fedora
if (env | grep -Fq 'fedora') then
  # Add fedora icon to prompt
  PS1+='%F{blue}%f '
fi
 
# Applied to all distrobox containers
if (env | grep -Fq 'DISTROBOX'); then
  # Box signifies a distrobox container
  PS1+='%F{magenta}⬢%f '
fi

setopt PROMPT_SUBST
precmd() {
  vcs_info;
  # Blue dir and green git info
  print -rP '%F{blue} %~%f %B%F{green}${vcs_info_msg_0_}%f%b';
}
# Simple zsh prompt (e.g. abdha-lptp@fedora % echo 'hello')
PS1+='%n@%m %% '

# App specific stuff (configs and aliases)
# Do fzf things only if fzf is installed
if type "fzf" > /dev/null; then
  # Enable zsh keybindings and auto-complete to fzf
  source /usr/share/fzf/shell/key-bindings.zsh
  if [[ -f ~/.config/fzf/completion.zsh ]] then
    source ~/.config/fzf/completion.zsh
  fi

  # Enable fd (faster find) integration in fzf
  if type "fd" > /dev/null; then
    # Use fd for searching files and directories
    export FZF_DEFAULT_COMMAND='fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
    export FZF_ALT_C_COMMAND='fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git'

    # Use fd for ** completion
    # - The first argument to the function ($1) is the base path to start traversal
    # - See the source code (completion.{bash,zsh}) for the details.
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type=d --hidden --follow --exclude ".git" . "$1"
    }
  fi

  if type "git" > /dev/null; then
    # Enable git integration for fzf
    source ~/.config/fzf/fzf-git/fzf-git.sh
  fi

  if type "bat" "eza" > /dev/null; then
    # Integrate bat and eza for use in fzf previews
    export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
    export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
    # Advanced customization of fzf options via _fzf_comprun function
    # - The first argument to the function is the name of the command.
    # - You should make sure to pass the rest of the arguments to fzf.
    _fzf_comprun() {
      local command=$1
      shift

      case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
      esac
    }
  fi

  # Enable my visual customisations
  if [[ -f ~/.config/fzf/theme.zsh ]] then
    source ~/.config/fzf/theme.zsh
  fi
fi

# Do zoxide things only if zoxide is installed
if type "zoxide" > /dev/null; then
  source ~/.config/aliases/zoxide.zsh
  eval "$(zoxide init zsh)"
fi

# Enable eza aliases (ls, ll, tree) if it is installed
if type "eza" > /dev/null; then
  source ~/.config/aliases/eza.zsh
fi

# Do bat things only if bat is installed
if type "bat" > /dev/null; then
  # Set theme to gruvbox-dark
  export BAT_THEME="gruvbox-dark"
fi

# Enable history based auto-complete (right arrow)
if [[ -f ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]] then
  source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

