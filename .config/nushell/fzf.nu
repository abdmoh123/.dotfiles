def file_fzf [] {
    fzf --preview 'bat -n --color=always --line-range :500 {}'
}
def dir_fzf [] {
    fzf --preview 'nu -c "eza --tree --color=always {} | split row \"\n\" | range 0..200 | to text"'
}

let fzf_dir_selector = {
    name: change_dir_with_fzf
    modifier: alt
    keycode: char_c
    mode: [ "emacs", "vi_insert", "vi_normal" ]
    event: {
        send: executehostcommand,
        cmd: "z (fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git | dir_fzf)"
    }
}

let fzf_file_selector = {
    name: get_file_path_with_fzf
    modifier: control
    keycode: char_t
    mode: [ "emacs", "vi_insert", "vi_normal" ]
    event: {
        send: executehostcommand,
        cmd: "commandline edit -a (fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git | file_fzf | str trim) | commandline set-cursor -e"
    }
}

let fzf_history_selector = {
    name: get_history_with_fzf
    modifier: control
    keycode: char_r
    mode: [ "emacs", "vi_insert", "vi_normal" ]
    event: {
        send: executehostcommand,
        cmd: "commandline edit (history | get command | reverse | uniq | to text | fzf | str trim) | commandline set-cursor -e"
    }
}
# fzf keybinds
$env.config.keybindings = [
    $fzf_dir_selector,
    $fzf_file_selector,
    $fzf_history_selector
]

# Customise the look of fzf
$env.FZF_DEFAULT_OPTS = $"
    --border='rounded' --border-label=' Search' --border-label-pos=2 --preview-window='border-rounded'
    --prompt='󰐊 ' --marker='◆' --pointer='󰐊' --separator='─' --scrollbar='│'"
