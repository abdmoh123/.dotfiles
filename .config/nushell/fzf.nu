# fzf keybinds
$env.config.keybindings = [
    {
        name: change_dir_with_fzf
        modifier: alt
        keycode: char_c
        mode: emacs
        event: {
            send: executehostcommand,
            cmd: "z (fd --type=d --strip-cwd-prefix --hidden --follow --exclude .git | fzf)"
        }
    }
    {
        name: get_file_path_with_fzf
        modifier: control
        keycode: char_t
        mode: emacs
        event: {
            send: executehostcommand,
            cmd: "commandline edit -a (fd --type=f --strip-cwd-prefix --hidden --follow --exclude .git | fzf | str trim) | commandline set-cursor -e"
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
