[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$agentsPath = Join-Path $repoRoot 'AGENTS.md'

if (-not (Test-Path -LiteralPath $agentsPath)) {
    throw "AGENTS.md not found at repository root: $agentsPath"
}

$lines = Get-Content -Encoding UTF8 -LiteralPath $agentsPath
$placeholders = $lines | Select-String -SimpleMatch '<填写'

if ($placeholders) {
    $placeholders | ForEach-Object {
        Write-Host "$($_.Path):$($_.LineNumber): $($_.Line.Trim())"
    }
    throw 'AGENTS.md still contains template placeholders. Complete the first-time initialization.'
}

if ($lines.Count -gt 200) {
    throw "AGENTS.md has $($lines.Count) lines. Move detailed guidance into linked documents and keep the root map below 200 lines."
}

Write-Host "AGENTS.md initialization check passed ($($lines.Count) lines)."
