# Customise the look of fzf
$fg_plus="#E2CCA9"
$bg_plus="#3C3836"
$blue="#80AA9E"
$aqua="#8BBA7F"
$orange="#F28534"
$red="#F2594B"
$purple="#D3869B"
$green="#B0B846"
$grey="#7C6F64"

$env:FZF_DEFAULT_THEME="
  --color=hl:${blue},hl+:${aqua},info:${grey},marker:${red}
  --color=fg:-1,fg+:${fg_plus},bg:-1,bg+:${bg_plus}
  --color=prompt:${orange},spinner:${purple},pointer:${green},header:${orange}
  --color=border:${grey},label:${blue},query:${fg_plus}
  --border='rounded' --border-label='🔍 Search' --border-label-pos=2 --preview-window='border-rounded'
  --prompt='> ' --marker='◆' --pointer='>' --separator='─'
  --scrollbar='│'"

$env:FZF_DEFAULT_OPTS=$env:FZF_DEFAULT_THEME

