# eza aliases
Remove-Alias -Name ls
function ls { eza --color=always --icons=always }
function la { eza -a --color=always --icons=always }
function ll { eza -l --no-permissions --no-filesize --no-time --no-user --color=always --icons=always }
function lla { eza -la --no-permissions --no-filesize --no-time --no-user --color=always --icons=always }
function lah { eza -lah --color=always --icons=always }

function tree { eza --tree --level=2 --color=always --icons=always }
function treea { eza --tree -a --level=2 --color=always --icons=always }
function treel { eza --tree --color=always --icons=always }
function treela { eza --tree -a --color=always --icons=always }
