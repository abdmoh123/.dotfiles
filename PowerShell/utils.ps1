function Command-Exists {
    param ($cmdName)
    if (Get-Command $cmdName -errorAction SilentlyContinue)
    {
        return $true
    }
    return $false
}
