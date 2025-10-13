source ./utils.nu

# Zoxide aliases
# ===============================================

alias nucd = cd  # Original nushell cd
if (bin_exists zoxide) {
	alias cd = z     # cd with zoxide
	alias cdi = zi   # zoxide cd with fzf integration
} else { echo "WARNING: zoxide not installed!" }

# Eza aliases
# =====================================================================================================================

alias nuls = ls  # Original nushell ls (outputs table)
if (bin_exists eza) {
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
} else { echo "WARNING: eza not installed!"}

# Git shortcuts
# ==============================================================================

if (bin_exists lazygit) {
	alias lz = lazygit                   # Lazygit alias
} else { echo "WARNING: lazygit not installed!" }

if (bin_exists git) {
	alias g = git                        # Git alias
	alias gs = git status                # git status
	alias gco = git checkout             # git checkout
	alias ga = git add                   # git add
	alias gd = git diff                  # git diff
	alias gl = git log                   # git log

	alias gc = git commit                # git commit
	alias gca = git commit -a            # git commit -a
	alias gcm = git commit -m            # git commit -m
	alias gcam = git commit -a -m        # git commit -a -m

	alias gpl = git pull                 # git pull
	alias gpsh = git push                # git push
	alias gpshu = git push -u            # git push + set upstream

	alias grsto = git restore            # git restore
	alias grstos = git restore --staged  # git restore --staged

	alias grst = git reset               # git reset
	alias grstm = git reset --mixed      # git reset --mixed
	alias grsts = git reset --soft       # git reset --soft
	# NOTE: git reset hard is not aliased to discourage its use and prevent mistakes
} else { echo "WARNING: git not installed!" }
