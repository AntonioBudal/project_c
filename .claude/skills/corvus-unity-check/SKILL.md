---
name: corvus-unity-check
description: Use when verifying a change in the Corvus Unity project before saying it is done, ready, passing or safe to commit — after C# edits, scene/prefab/asset changes made via the Editor, art imports, or when the user asks to "check", "conferir", "verificar" or "testar no Play Mode".
---

# corvus-unity-check

Verificação L1–L3 do Corvus com evidência de comando, num caminho fixo e barato. L4 (aprovação visual) é do usuário.

## Receita (Editor aberto)

Rode a partir da raiz do projeto, nesta ordem:

1. **L1 + L2** — compilação, console e testes EditMode, numa chamada:
   ```
   powershell -NoProfile -ExecutionPolicy Bypass -File .claude/skills/corvus-unity-check/scripts/check-l1l2.ps1 [-Filter <nome do teste>]
   ```
   Saída de exit 2 = Editor indisponível → seção "Editor fechado".
   VERMELHO → pare, corrija (systematic-debugging) e rode de novo. Não vá para o L3.

2. **L3** — só quando a mudança aparece ou roda em Play Mode (cena, prefab, MonoBehaviour, arte, câmera):
   ```
   powershell -NoProfile -ExecutionPolicy Bypass -File .claude/skills/corvus-unity-check/scripts/check-l3.ps1 -Out <scratchpad>\l3-<feature>.png [-Probe <sonda.cs>] [-Seconds 3]
   ```
   - Resolução: a de referência do docs/ART_PIPELINE.md, ampliada no máximo 2x. Enquanto ela estiver EM ABERTO, use o padrão 480x270.
   - Sonda: um .cs no scratchpad para `script eval`, que devolve os números que provam a mudança
     (posição, velocidade, contagem de objetos, sorting order). Um `return` com uma string curta.
   - Abra o PNG com Read e descreva o que ele mostra. Uma captura por verificação.
   - O script sempre sai do Play Mode e não limpa o console.

3. **Relatório** (contrato abaixo).

Mudança só em C# do Domain, sem nada em cena: L1 + L2 bastam; diga que o L3 não se aplica e por quê.

## Contrato do relatório

O relatório ao usuário tem exatamente estas partes, nesta ordem:

1. **Veredito** em uma linha: `L1–L2 verde`, `L1–L3 verde, falta L4` ou `vermelho em Lx`.
2. **Evidências**: as linhas `L1 …`, `L2 …`, `L3 …` que os scripts imprimiram, copiadas como saíram.
3. **Screenshot** (se houve L3): caminho e uma frase sobre o que aparece nele.
4. **Para o seu olho (L4)**: o que só o usuário pode julgar nesta mudança (feel, leitura visual, sorting).
5. **Não verificado**: o que ficou de fora e por quê. Vazio só se nada ficou de fora.

## Editor fechado

```
& "C:\Program Files\Unity\Hub\Editor\6000.3.28f1\Editor\Unity.exe" -batchmode -nographics -projectPath C:\Users\User\project_c -logFile <scratchpad>\batch.log -quit
unity test --mode EditMode --output Logs/editmode.xml
```
Leia o log só filtrado (`error CS`, `Exception:`, `[Error]`). Sem Editor não há L3: diga isso no item 5.

## Erros comuns

| Sintoma | Causa | O que fazer |
|---|---|---|
| Console e testes vêm vazios logo após compilar | domain reload em andamento | o script já espera `status --until-ready`; se chamar comandos à mão, espere também |
| `unity test` diz que o projeto já está aberto | ele abre outra Unity | com Editor aberto, use o script (que usa `command test run`) |
| JSON de `--condition`/`--code` chega quebrado | PowerShell 5.1 tira aspas de argumentos nativos | use `\"` dentro do JSON, ou `--file` para eval |
| Script .ps1 falha com "Token inesperado" | arquivo UTF-8 sem BOM lido como ANSI | mantenha os scripts em ASCII |
| Vontade de reler a doc da skill unity-cli | — | os comandos daqui já foram testados neste projeto; use-os direto |
