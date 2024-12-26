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
