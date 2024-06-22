# eza aliases
Set-Alias -Name ls -Value new_ls
Set-Alias -Name la -Value new_la
Set-Alias -Name lsa -Value new_la
Set-Alias -Name ll -Value new_ll
Set-Alias -Name lla -Value new_lla
Set-Alias -Name lah -Value new_lah

function new_ls { eza --color=always --icons=always --group-directories-first @args }
function new_la { eza -a --color=always --icons=always --group-directories-first @args }
function new_ll { eza -l --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first @args }
function new_lla { eza -la --no-permissions --no-filesize --no-time --no-user --color=always --icons=always --group-directories-first @args }
function new_lah { eza -lah --color=always --icons=always --group-directories-first @args }

Set-Alias -Name tree -Value new_tree
Set-Alias -Name treea -Value new_treea
Set-Alias -Name treel -Value new_treel
Set-Alias -Name treela -Value new_treela

function new_tree { eza --tree --level=2 --color=always --icons=always --group-directories-first @args }
function new_treea { eza --tree -a --level=2 --color=always --icons=always --group-directories-first @args }
function new_treel { eza --tree --color=always --icons=always --group-directories-first @args }
function new_treela { eza --tree -a --color=always --icons=always --group-directories-first @args }
