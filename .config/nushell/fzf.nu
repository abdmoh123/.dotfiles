def file_fzf [] {
    fzf --preview 'bat -n --color=always --line-range :500 {}'
}
def dir_fzf [] {
    fzf --preview 'nu -c "eza --tree --color=always {} | split row \"\n\" | range 0..200 | to text"'
}

# fzf keybinds
$env.config.keybindings = [
    {
        name: change_dir_with_fzf
        modifier: alt
        keycode: char_c
        mode: emacs
        event: {
            send: executehostcommand,
            cmd: "z (fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git | dir_fzf)"
        }
    }
    {
        name: get_file_path_with_fzf
        modifier: control
        keycode: char_t
        mode: emacs
        event: {
            send: executehostcommand,
            cmd: "commandline edit -a (fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git | file_fzf | str trim) | commandline set-cursor -e"
        }
    }
    {
        name: get_history_with_fzf
        modifier: control
        keycode: char_r
        mode: emacs
        event: {
            send: executehostcommand,
            cmd: "commandline edit (history | get command | reverse | uniq | to text | fzf | str trim) | commandline set-cursor -e"
        }
    }
]
