# eza aliases
Remove-Alias -Name ls
function ls { eza --color=always --icons=always @args }
function la { eza -a --color=always --icons=always @args }
function ll { eza -l --no-permissions --no-filesize --no-time --no-user --color=always --icons=always @args }
function lla { eza -la --no-permissions --no-filesize --no-time --no-user --color=always --icons=always @args }
function lah { eza -lah --color=always --icons=always @args }

function tree { eza --tree --level=2 --color=always --icons=always @args }
function treea { eza --tree -a --level=2 --color=always --icons=always @args }
function treel { eza --tree --color=always --icons=always @args }
function treela { eza --tree -a --color=always --icons=always @args }
