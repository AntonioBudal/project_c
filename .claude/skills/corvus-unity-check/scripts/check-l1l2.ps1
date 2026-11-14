# Verificacao L1 (compilacao + console) e L2 (testes EditMode) do Corvus, com o Editor aberto.
# Uso: powershell -NoProfile -ExecutionPolicy Bypass -File .claude/skills/corvus-unity-check/scripts/check-l1l2.ps1 [-Filter <nome>]
# Saida: poucas linhas, ja resumidas. Codigo de saida 0 = verde, 1 = vermelho, 2 = Editor indisponivel.
param([string]$Filter = "")

$ErrorActionPreference = "Continue"
function U { & unity --no-banner --no-pager --json @args 2>$null }

# 0. Editor conectado e pronto
$st = (U status --until-ready --timeout 120) | Out-String
if ($st -notmatch '"ready"') {
    Write-Output "EDITOR: indisponivel (unity status nao chegou a ready). Use a verificacao com Editor fechado."
    exit 2
}

# L1a. Recompilar e ler o resultado
$rc = (U recompile --timeout 180) | Out-String | ConvertFrom-Json
$d = $rc.data
Write-Output ("L1 compilacao: status={0} erros={1} avisos={2}" -f $d.status, $d.summary.errors, $d.summary.warnings)
foreach ($e in @($d.errors | Select-Object -First 5)) { Write-Output "  ERRO: $e" }
foreach ($w in @($d.warnings | Select-Object -First 5)) { Write-Output "  AVISO: $w" }
# Depois de compilar ha um domain reload: esperar o Editor voltar a ready antes de consultar console e testes.
U status --until-ready --timeout 120 | Out-Null

# L1b. Console (pega erros de import e de inicializacao que a compilacao nao mostra)
$cs = (U command console status) | Out-String
$gt = [regex]::Match($cs, '"groundTruth":\{[^}]*\}').Value
$ce = [regex]::Match($gt, '"consoleErrors":(\d+)').Groups[1].Value
$cw = [regex]::Match($gt, '"consoleWarnings":(\d+)').Groups[1].Value
$cf = [regex]::Match($gt, '"compilationFailed":(\w+)').Groups[1].Value
Write-Output ("L1 console: erros={0} avisos={1} falhaDeCompilacao={2}" -f $ce, $cw, $cf)
if ([int]$ce -gt 0) {
    $ge = (U command console get --level error --tail 5) | Out-String
    foreach ($m in [regex]::Matches($ge, '"message":"((?:[^"\\]|\\.){0,200})')) { Write-Output "  CONSOLE: $($m.Groups[1].Value)" }
}

# L2. Testes EditMode (uma linha NDJSON por teste)
$args2 = @("command", "test", "run", "--mode", "editor")
if ($Filter) { $args2 += @("--filter", $Filter) }
$lines = @(U @args2) | Where-Object { $_ -match '^\{"fullName"' }
$results = $lines | ForEach-Object { $_ | ConvertFrom-Json }
$pass = @($results | Where-Object status -eq "Passed").Count
$fail = @($results | Where-Object status -ne "Passed")
Write-Output ("L2 testes EditMode: total={0} passaram={1} falharam={2}" -f $results.Count, $pass, $fail.Count)
foreach ($f in $fail) { Write-Output ("  FALHOU: {0} - {1}" -f $f.fullName, ($f.message -replace '\s+', ' ')) }

$green = ($d.summary.errors -eq 0) -and (-not $d.failed) -and ([int]$ce -eq 0) -and ($cf -ne "true") -and ($results.Count -gt 0) -and ($fail.Count -eq 0)
if ($green) { Write-Output "RESULTADO L1+L2: VERDE"; exit 0 } else { Write-Output "RESULTADO L1+L2: VERMELHO"; exit 1 }
