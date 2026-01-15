# let fnm_path = (which fnm).path | first
let fnm_path = "~/.local/share/fnm"

# skip fnm stuff if the path doesn't exist (not installed)
if not ($fnm_path | path exists) {
	return
}

$env.PATH = ($env.PATH | prepend $fnm_path)

load-env (fnm env --shell bash
	| lines
	| str replace 'export ' ''
	| str replace -a '"' ''
	| split column '='
	| rename name value
	| where name != "FNM_ARCH" and name != "PATH"
	| reduce -f {} {|it, acc| $acc
		| upsert $it.name $it.value })

let is_windows = ((sys host | select name).name == "Windows")
let path_to_add = if $is_windows {
	$env.FNM_MULTISHELL_PATH
} else {
	$"($env.FNM_MULTISHELL_PATH)/bin"
}

$env.PATH = ($env.PATH | prepend path_to_add)

