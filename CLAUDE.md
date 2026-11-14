# Corvus — instruções para o Claude Code

Jogo 2D em pixel art (top-down 3/4) na Unity 6000.3.28f1 LTS, URP 2D. Desenvolvedor solo, júnior, Windows.
Toda arte final é do usuário: nunca gerar arte final nem usar IA para arte. Metodologia única: Superpowers.

## Mapa de documentos
- docs/gdd/corvus-conceito.md — GDD, somente leitura. Ler só a seção relevante. Nunca importar com @.
- docs/pacote-transferencia.md — método (Seções 0–15). Ler só a seção necessária. Nunca importar com @.
- docs/ARCHITECTURE.md — assemblies, pastas, padrões de código (vivo, ≤2 páginas).
- docs/ART_PIPELINE.md — contrato de arte (import, nomes, sorting, entrega).
- docs/ROADMAP.md — fila de features e fases.
- docs/decisions/NNNN-*.md — ADRs. docs/superpowers/specs/ e plans/ — specs e planos.
- docs/HANDOFF.md — estado atual do trabalho (carregado pelo hook a cada sessão).

## Design
- "Decisão" no GDD é definitivo. "Proposta" é provisório: perguntar antes de construir algo que dependa disso.
- Não redesenhar o jogo, não inventar regra de jogo. Em dúvida de regra: perguntar.
- Specs e planos citam o GDD por seção, nunca copiam o conteúdo.

## Papéis
- Usuário: pixel art, paletas, direção artística, layout, ajuste de feel, aprovação visual (L4).
- Claude: C#, testes, ferramentas de Editor, integração de arte, cenas/prefabs/SOs, tilemaps, sorting,
  colisões, animators, verificação L1–L3, documentação técnica.
- Decidir junto com o usuário: PPU/tile/resolução/câmera; nomes e pastas; novas dependências; mudanças de
  arquitetura (ADR); upgrades de Unity; placeholders em entregas; qualquer operação destrutiva.

## Regras invioláveis
1. Nunca editar como texto *.unity, *.prefab, *.meta, *.asset, *.controller, *.anim, *.spriteatlasv2
   (nem pelo shell). Mudar só por APIs do Editor (EditorSceneManager, PrefabUtility, AssetDatabase,
   SerializedObject, Tilemap, AnimatorController) via `unity command`, eval ou -executeMethod.
   O settings.json bloqueia Edit/Write nesses arquivos.
2. Nunca apagar/recriar arquivos de arte: sobrescrever bytes no mesmo caminho; renomear só com
   AssetDatabase.MoveAsset. Commitar asset + .meta juntos.
3. Agrupar edições de C#, esperar compilação + console limpo, só então operar cena. Escrita que expirou =
   estado desconhecido: conferir antes de repetir.
4. Nunca declarar "pronto" sem evidência L1–L3 (saída de comando). L4 é do usuário.
5. Uma feature por sessão, em sequência. Escopo explícito (arquivos/pastas).
6. Não "melhorar" decisões registradas em ADR.
7. Feel é dado: velocidades, timings e câmera em ScriptableObjects ou campos ajustáveis pelo usuário.
8. Projeto em caminho sem espaços.

## Fluxo e verificação
- Nível 0 (correção): systematic-debugging + check. Nível 1 (feature pequena): brainstorming curto →
  writing-plans → execução → check. Nível 2 (sistema/cena): brainstorming completo com "Manifesto de cena e
  assets" → aprovação → plano com tarefas [code]/[scene]/[config]/[art] → execução → check → code review → L4.
- Executar planos com subagent-driven-development (cada tarefa num subagente; conversa principal pequena).
- L1 compilação + console limpo · L2 testes EditMode (e PlayMode) · L3 Play Mode curto + sondas numéricas +
  screenshot na resolução de referência · L4 aprovação do usuário.
- Tarefas [art] bloqueiam as que dependem delas: listar ao usuário nome canônico, tamanho, frames e direções.

## Skills do projeto (.claude/skills/)
- corvus-unity-check — verificação L1–L3 com scripts prontos e contrato de relatório. Usar antes de dizer "pronto".
- corvus-art-intake — será criada no spike 0b, junto com o postprocessor e o validador.

## Comandos Unity verificados (CLI 1.0.0, Editor aberto)
- Estado: `unity status` (esperar "ready"; logo após abrir aparece "unreachable").
- Listar comandos: `unity command` e `unity command <grupo>`. Nomes mudam entre versões; conferir antes.
- Eval: `unity command script eval --file <arquivo.cs>` (no PowerShell, --code com aspas quebra).
- Screenshot: `unity command capture game_view --width W --height H --output-path <fora de Assets>`.
- Testes: `unity command script recompile`, depois `unity command test run --mode editor [--filter X]`.
  Com o Editor fechado: `unity test --mode EditMode --output Logs/editmode.xml` (abre uma Unity própria).
- Console: `unity command console status` (contagens, falha de compilação); `unity command console get --level error`.
- Editor fechado, batch: `Unity.exe -batchmode -nographics -projectPath <p> -logFile <log> -quit`
  (Unity.exe em C:\Program Files\Unity\Hub\Editor\6000.3.28f1\Editor\). Ler o log só filtrado.

## Versões (conferidas em 2026-11-14)
- Unity 6000.3.28f1 LTS. Não usar 6000.6/6000.7/7000. Unity CLI 1.0.0. com.unity.pipeline 1.0.0.
- Pacotes: URP 17.3.0, Tilemap Extras 6.0.3, Aseprite Importer 3.0.2, Test Framework 1.6.0.
  Ao adicionar pacote, escolher a versão cujo campo "unity" seja 6000.3.
- Plugins Claude Code: Superpowers 7.0.2; Unity 0.1.9-beta (unity@anthropic-plugin-directory, escopo do projeto).

## Git
- Nunca commitar direto na main. Cada funcionalidade usa uma branch feature/<nome-curto>.
- Commits pequenos de checkpoint dentro da branch são permitidos e não vão para o GitHub.
- Ao concluir uma funcionalidade aprovada, integrar com git merge --squash na main (um commit, formato
  feat(<área>): <resumo>) e apagar a branch. Em finishing-a-development-branch, escolher sempre squash.
- Push só depois do squash e com aprovação do usuário. Nunca force push na main.
- Mensagens de commit em português, linguagem simples. Sem linha Co-Authored-By do Claude.
- Commit antes de cada sessão e após cada verificação verde; .meta sempre junto; `git status` sem .meta órfão.
- .claude/settings.json e .claude/hooks/ são versionados; só .claude/settings.local.json fica fora do git.
- Evitar git worktree com Unity (reimport da Library).

## Sessões
- Uma sessão por tipo de trabalho: design, plano, implementação, revisão visual/feel, integração de arte ou depuração.
- Nome: "Corvus · <etapa> · <tipo>", tipo em design, plano, implementação, revisão, arte, depuração ou setup.
  A primeira linha do HANDOFF é "Sessão: <nome>"; o hook usa essa linha como título ao abrir, retomar ou
  bifurcar. Depois de /clear o hook não renomeia: o HANDOFF traz o /rename a digitar.
- O estado do trabalho vive em arquivos: specs e planos em docs/superpowers/, progresso em docs/HANDOFF.md.
- Avisar que é hora de trocar de sessão quando: (a) um tipo de trabalho terminar; (b) a funcionalidade for
  integrada com squash; (c) o usuário precisar corrigir a mesma coisa pela segunda vez; (d) /context indicar
  mais de 200 mil tokens. Não pedir troca no meio de um ciclo de erro e correção da mesma tarefa.
- Antes de avisar, atualizar docs/HANDOFF.md (feito, branch e commits, próximo passo exato, decisões
  pendentes, arquivos relevantes) e dizer: "Pode rodar /clear".
- /branch só quando o usuário pedir para testar uma alternativa, sempre com uma branch de git. /rewind não
  desfaz mudanças feitas na Unity; para isso, usar git.

## Economia de contexto na Unity
- Screenshots na resolução de referência da Pixel Perfect Camera, ampliada no máximo 2x. Uma por verificação.
- Logs da Unity e saídas de teste: nunca ler inteiros. Filtrar por erros e avisos, ou delegar a um subagente.
- Nunca ler .unity, .prefab ou .meta para entender a cena. Usar comandos da CLI que listam a hierarquia.

# Compact instructions
Ao compactar, preserve: a funcionalidade atual e sua branch, o próximo passo, erros ainda abertos e os
comandos de teste. Descarte screenshots antigos e logs já resolvidos.
