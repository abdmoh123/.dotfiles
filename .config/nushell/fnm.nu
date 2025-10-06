let fnm_path = "~/.local/share/fnm"

# skip fnm stuff if the path doesn't exist (not installed)
if not ($fnm_path | path exists) {
	return
}

$env.PATH = ($env.PATH | prepend fnm_path)

load-env (fnm env --shell bash
	| lines
	| str replace 'export ' ''
	| str replace -a '"' ''
	| split column '='
	| rename name value
	| where name != "FNM_ARCH" and name != "PATH"
	| reduce -f {} {|it, acc| $acc
		| upsert $it.name $it.value })

$env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")

