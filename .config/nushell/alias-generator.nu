source ./utils.nu

let aliases = []
# Zoxide aliases
# ===============================================

alias nucd = cd  # Original nushell cd
let aliases = if (bin_exists zoxide) {
	$aliases
		| append { alias: "cd", command: `z` }
		| append { alias: "cdi" command: `zi` }  # zoxide cd with fzf integration
} else { $aliases }
if not (bin_exists zoxide) { echo "WARNING: zoxide not installed!" }

# Eza aliases
# =====================================================================================================================

alias nuls = ls  # Original nushell ls (outputs table)
let aliases = if (bin_exists eza) {
	$aliases
		| append { alias: "ls", command: `eza --color=always --icons=always --group-directories-first` }
		| append { alias: "la", command: `eza -a --color=always --icons=always --group-directories-first` }
		| append { alias: "lsa", command: `la` }
		| append { alias: "ll", command: `eza -l --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first` }
		| append { alias: "lla", command: `eza -la --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first` }
		| append { alias: "lah", command: `eza -lah --color=always --icons=always --group-directories-first` }
		| append { alias: "tree", command: `eza --tree --level=2 --color=always --icons=always --group-directories-first` }
		| append { alias: "treea", command: `eza --tree -a --level=2 --color=always --icons=always --group-directories-first` }
		| append { alias: "treel", command: `eza --tree --color=always --icons=always --group-directories-first` }
		| append { alias: "treela", command: `eza --tree -a --color=always --icons=always --group-directories-first` }
} else { $aliases }
if not (bin_exists eza) { echo "WARNING: eza not installed!" }

# ls aliases for nushell
def lsg [
	dir?: path
	-a
] {
	let $dir = match $dir {
		null => "."
		_ => $dir
	}

	if $a {
		nuls -a $dir | sort-by type name | grid --color --icons --separator='   '
	} else {
		nuls $dir | sort-by type name | grid --color --icons --separator='   '
	}
}

# Git shortcuts
# ==============================================================================

let aliases = if (bin_exists lazygit) {
	 $aliases | append { alias: "lz", command: `lazygit` }                   # Lazygit alias
} else { $aliases }
if not (bin_exists lazygit) { echo "WARNING: lazygit not installed!" }

let aliases = if (bin_exists git) {
	$aliases
		| append { alias: "g", command: `git` }                        # Git alias
		| append { alias: "gs", command: `git status` }                # git status
		| append { alias: "gco", command: `git checkout` }             # git checkout
		| append { alias: "ga", command: `git add` }                   # git add
		| append { alias: "gd", command: `git diff` }                  # git diff
		| append { alias: "gl", command: `git log` }                   # git log
		| append { alias: "gc", command: `git commit` }                # git commit
		| append { alias: "gca", command: `git commit -a` }            # git commit -a
		| append { alias: "gcm", command: `git commit -m` }            # git commit -m
		| append { alias: "gcam", command: `git commit -a -m` }        # git commit -a -m
		| append { alias: "gpl", command: `git pull` }                 # git pull
		| append { alias: "gpsh", command: `git push` }                # git push
		| append { alias: "gpshu", command: `git push -u` }            # git push + set upstream
		| append { alias: "grsto", command: `git restore` }            # git restore
		| append { alias: "grstos", command: `git restore --staged` }  # git restore --staged
		| append { alias: "grst", command: `git reset` }               # git reset
		| append { alias: "grstm", command: `git reset --mixed` }      # git reset --mixed
		| append { alias: "grsts", command: `git reset --soft` }       # git reset --soft
} else { $aliases }
if not (bin_exists git) { echo "WARNING: git not installed!" }

# NOTE: git reset hard is not aliased to discourage its use and prevent mistakes

$aliases
	| each { |a| $"alias ($a.alias) = ($a.command)" }
	| str join "\n"
	| save -f $"($nu.default-config-dir)/generated-aliases.nu"
