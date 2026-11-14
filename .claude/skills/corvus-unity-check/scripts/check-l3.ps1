# Verificacao L3 do Corvus: Play Mode curto + sonda numerica opcional + screenshot. Editor aberto.
# Uso: powershell -NoProfile -ExecutionPolicy Bypass -File <este arquivo> -Out <png fora de Assets>
#        [-Seconds 3] [-Width 480] [-Height 270] [-Probe <arquivo .cs para script eval>]
# Nao limpa o console: compara as contagens antes e depois. Sempre sai do Play Mode, mesmo com erro.
# Codigo de saida 0 = verde, 1 = vermelho, 2 = Editor indisponivel.
param(
    [Parameter(Mandatory = $true)][string]$Out,
    [int]$Seconds = 3,
    [int]$Width = 480,
    [int]$Height = 270,
    [string]$Probe = ""
)

$ErrorActionPreference = "Continue"
function U { & unity --no-banner --no-pager --json @args 2>$null }
function Counts {
    $cs = (U command console status) | Out-String
    $gt = [regex]::Match($cs, '"groundTruth":\{[^}]*\}').Value
    [pscustomobject]@{
        Errors   = [int]([regex]::Match($gt, '"consoleErrors":(\d+)').Groups[1].Value)
        Warnings = [int]([regex]::Match($gt, '"consoleWarnings":(\d+)').Groups[1].Value)
    }
}

$st = (U status --until-ready --timeout 120) | Out-String
if ($st -notmatch '"ready"') { Write-Output "EDITOR: indisponivel."; exit 2 }

$before = Counts
$ok = $true
try {
    U command editor.playmode start | Out-Null
    U status --until-ready --timeout 60 | Out-Null
    # PowerShell 5.1 tira as aspas de argumentos para programas nativos: por isso o \" no JSON.
    $w = (U command job wait --condition '{\"member\":\"UnityEngine.Time.frameCount\",\"op\":\"changed\"}' --timeout 10) | Out-String
    if ($w -notmatch '"met":\s*true') { Write-Output "L3 play: os frames NAO avancaram"; $ok = $false }
    else { Write-Output "L3 play: entrou em Play Mode e os frames avancam" }
    Start-Sleep -Seconds $Seconds

    if ($Probe) {
        $pr = (& unity --no-banner --no-pager command script eval --file $Probe 2>$null) | Where-Object { $_ -notmatch 'claude-code-hint' } | Select-Object -Last 3
        Write-Output ("L3 sonda: " + ($pr -join " | "))
    }

    $cap = (U command capture game_view --width $Width --height $Height --output-path $Out) | Out-String
    if ($cap -match 'savedPath') { Write-Output ("L3 screenshot: {0} ({1}x{2})" -f $Out, $Width, $Height) }
    else { Write-Output "L3 screenshot: FALHOU"; $ok = $false }
}
finally {
    U command editor.playmode stop | Out-Null
    U status --until-ready --timeout 60 | Out-Null
}

$after = Counts
$newErr = $after.Errors - $before.Errors
$newWarn = $after.Warnings - $before.Warnings
Write-Output ("L3 console durante o Play Mode: erros novos={0} avisos novos={1}" -f $newErr, $newWarn)
if ($newErr -gt 0) {
    $ge = (U command console get --level error --tail ([Math]::Min($newErr, 5))) | Out-String
    foreach ($m in [regex]::Matches($ge, '"message":"((?:[^"\\]|\\.){0,200})')) { Write-Output "  CONSOLE: $($m.Groups[1].Value)" }
    $ok = $false
}

if ($ok) { Write-Output "RESULTADO L3 (automatico): VERDE - falta olhar o screenshot"; exit 0 }
else { Write-Output "RESULTADO L3: VERMELHO"; exit 1 }
