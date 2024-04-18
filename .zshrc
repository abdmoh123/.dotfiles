# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/var/home/abdha/.zshrc'

# Applied to all distrobox containers
if (env | grep -Fq 'DISTROBOX'); then
  PS1='📦'
fi

# Exclusive to fedora distrobox container
if [[ "$(hostname)" == *"fedora"* ]] then
  PS1+=' %n@%m '

  # Apply aliases
  . ~/.config/zsh/fedora_aliases.zsh

  # Do bat things only if bat is installed
  if type "bat" > /dev/null; then
    # Set theme to gruvbox-dark
    export BAT_THEME="gruvbox-dark"
  fi

  
  # Do fzf things only if fzf is installed
  if type "fzf" > /dev/null; then
    # Enable zsh keybindings to fzf
    source /usr/share/fzf/shell/key-bindings.zsh
    source ~/.config/fzf/completion.zsh

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

    # Enable git integration for fzf
    source ~/.config/fzf/fzf-git/fzf-git.sh

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

    # Customise the look of fzf
    fg_plus="#E2CCA9"
    bg_plus="#3C3836"
    blue="#80AA9E"
    aqua="#8BBA7F"
    orange="#F28534"
    red="#F2594B"
    purple="#D3869B"
    green="#B0B846"
    grey="#7C6F64"
    export FZF_DEFAULT_OPTS="
      --color=hl:${blue},hl+:${aqua},info:${grey},marker:${red}
      --color=fg:-1,fg+:${fg_plus},bg:-1,bg+:${bg_plus}
      --color=prompt:${orange},spinner:${purple},pointer:${green},header:${orange}
      --color=border:${grey},label:${blue},query:${fg_plus}
      --border='rounded' --border-label='🔍 Search' --border-label-pos=2 --preview-window='border-rounded'
      --prompt='> ' --marker='◆' --pointer='>' --separator='─'
      --scrollbar='│'"
  fi

  # Do zoxide things only if zoxide is installed
  if type "zoxide" > /dev/null; then
    eval "$(zoxide init zsh)"
  fi
fi

autoload -Uz compinit
compinit
# End of lines added by compinstall

# load version control info
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '[%b]'

# green dir and white '>' sign and cmd text
setopt PROMPT_SUBST
precmd() {
  vcs_info;
  print -rP '%F{blue}%~%f %B%F{green}${vcs_info_msg_0_}%f%b';
}
PS1+='%% '

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

