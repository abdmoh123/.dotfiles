
# load version control info
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '[%b]'

# green dir and white '>' sign and cmd text
setopt PROMPT_SUBST
precmd() {
  vcs_info;
  print -rP '%F{blue}%~%f %B%F{green}${vcs_info_msg_0_}%f%b';
}
PROMPT='%% '

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

