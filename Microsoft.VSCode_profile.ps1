Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme star #alien

if ($env:TERM_PROGRAM -eq 'vscode' ) {
    Set-PSReadLineOption -PredictionViewStyle ListView
} else {
    Set-PSReadLineOption -PredictionViewStyle InlineView
}
Set-PSReadLineOption -PredictionSource HistoryAndPlugin

if (Get-Command code-insiders -ErrorAction SilentlyContinue) {
    Set-Alias -Name code -Value code-insiders
}

function Clear-GitRepo {
    (git branch).Trim() | Where-Object { $_ -notmatch 'main|\*' } | ForEach-Object { git branch $_ -d -f }
}

Save-IPConfig
