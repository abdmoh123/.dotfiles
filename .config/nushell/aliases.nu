# zoxide -> cd
alias nucd = cd  # keep original function
alias cd = z
alias cdi = zi

# eza -> ls
alias nuls = ls  # keep original function
alias ls = eza --color=always --icons=always --group-directories-first
alias la = eza -a --color=always --icons=always --group-directories-first
alias lsa = la
alias ll = eza -l --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first
alias lla = eza -la --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first
alias lah = eza -lah --color=always --icons=always --group-directories-first

alias tree = eza --tree --level=2 --color=always --icons=always --group-directories-first
alias treea = eza --tree -a --level=2 --color=always --icons=always --group-directories-first
alias treel = eza --tree --color=always --icons=always --group-directories-first
alias treela = eza --tree -a --color=always --icons=always --group-directories-first

# git shortcuts
alias lz = lazygit

alias g = git
alias gs = git status
alias gco = git checkout
alias ga = git add
alias gd = git diff
alias gl = git log

alias gc = git commit
alias gca = git commit -a
alias gcm = git commit -m
alias gcam = git commit -a -m

alias gpl = git pull  # Git pull
alias gpsh = git push  # Git push
alias gpshu = git push -u  # Git push + set upstream

alias grsto = git restore  # Git restore
alias grstos = git restore --staged  # Git restore --staged
alias grst = git reset  # Git reset
alias grstm = git reset --mixed  # Git reset --mixed
alias grsts = git reset --soft  # Git reset --soft
# git reset hard is not aliased to discourage its use and prevent mistakes
