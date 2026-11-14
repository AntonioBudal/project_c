# SessionStart hook: injeta docs/HANDOFF.md como contexto da sessao.
# Roda via powershell.exe (Windows PowerShell 5.1), chamado em exec form pelo settings.json.
# Se o HANDOFF nao existir, sai sem imprimir nada.

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$projectDir = $env:CLAUDE_PROJECT_DIR
if (-not $projectDir) { $projectDir = (Get-Location).Path }

$handoff = Join-Path $projectDir 'docs\HANDOFF.md'
if (-not (Test-Path -LiteralPath $handoff)) { exit 0 }

$content = [System.IO.File]::ReadAllText($handoff, [System.Text.Encoding]::UTF8)
if ([string]::IsNullOrWhiteSpace($content)) { exit 0 }

# Entrada do hook (JSON no stdin): source e, se houver, session_title.
$source = ''
$currentTitle = ''
try {
    $raw = [Console]::In.ReadToEnd()
    if ($raw) {
        $inp = $raw | ConvertFrom-Json
        if ($inp.source) { $source = [string]$inp.source }
        if ($inp.session_title) { $currentTitle = [string]$inp.session_title }
    }
} catch { }

# Titulo da sessao: primeira linha "Sessão: ..." do HANDOFF.
# O Claude Code so aplica sessionTitle em startup, resume e fork (nao em clear/compact).
$title = $null
$m = [regex]::Match($content, '(?m)^\s*Sess(?:\u00e3|a)o:\s*(.+?)\s*$')
if ($m.Success) { $title = $m.Groups[1].Value }

$header = "Estado atual do projeto Corvus, lido de docs/HANDOFF.md no inicio da sessao. Trate como fatos sobre o projeto (o que foi feito, branch, proximo passo, decisoes pendentes):`n`n"
$text = $header + $content

# Claude Code corta additionalContext acima de 10.000 caracteres.
$limit = 9500
if ($text.Length -gt $limit) {
    $text = $text.Substring(0, $limit) + "`n`n[HANDOFF cortado: passou de $limit caracteres. Leia docs/HANDOFF.md inteiro.]"
}

$out = @{
    hookEventName     = 'SessionStart'
    additionalContext = $text
}
if ($title -and $title -ne $currentTitle -and @('startup', 'resume', 'fork') -contains $source) {
    $out.sessionTitle = $title
}
$payload = @{ hookSpecificOutput = $out }
$payload | ConvertTo-Json -Depth 4 -Compress
exit 0
