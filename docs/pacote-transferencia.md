# CORVUS — Pacote de transferência (v1, 13/11/2026)

## 0. Como usar
Você (Claude Code) vai conduzir a engenharia do Corvus na Unity. Este pacote define COMO trabalhar.
O planejamento aprovado do Corvus (anexo) define O QUÊ. Não redesenhe o jogo, não reabra brainstorming
de game design, não modifique o GDD. Em dúvida de regra de jogo: pergunte.
Primeira tarefa: executar a Seção 13 (atividades preparatórias), uma etapa por vez, pedindo confirmação
antes de instalar qualquer coisa.

## 1. Contexto fixo (resumo; detalhes no GDD)
Unity 2D, pixel art, top-down 3/4. Líder controlado pelo jogador explorando cidades bálticas medievais.
Corvídeos individuais com temperamento e memória; "relatório de voo" filtrado pela atenção da ave
(câmera sobe com a ave; jogador não controla o voo). Mapa de província por estados visuais
(desconhecido/conhecido/presença/integrado; soberania + influência; insígnias; rotas). Viagem por escolha
de destino + eventos curtos de estrada. Dois caminhos institucionais irreversíveis (Espada/Comunicação)
com duas barras de falha cada. Capítulos com sucessão de líder por tempo.
Desenvolvedor: solo, júnior, Windows. TODA arte final é do usuário. Nunca gere arte final.

## 2. Papéis
- Usuário: toda pixel art, paletas, direção artística, composição/layout, ajuste de feel, aprovação visual (L4).
- Claude: C#, testes, ferramentas de Editor, import/integração de arte, cenas/prefabs/SOs, tilemaps,
  sorting, colisões, animators, verificação L1–L3, documentação técnica.
- Aprovação conjunta: PPU/tile/resolução de referência/modo de câmera; convenções de nome e pastas;
  novas dependências/ferramentas; mudanças de arquitetura (ADR); upgrades de Unity; placeholders em
  entregas; qualquer operação destrutiva (apagar/renomear em massa/reimport que muda IDs/reescrever git).

## 3. Ferramentas escolhidas (status em nov/2026 — VERIFICAR versões atuais antes de instalar)
- Unity 6 LTS mais recente (confirmar no Hub; provável 6000.3 LTS). NÃO usar Unity 7 beta.
- URP + 2D Renderer; Pixel Perfect Camera do URP; 2D Tilemap + Tilemap Extras; Test Framework (core).
- Plugin oficial "Unity" para Claude Code (Unity Technologies, set/2026; 29 skills). Confirmar comando de
  instalação no marketplace.
- Unity CLI (BETA, gratuito) + com.unity.pipeline (EXPERIMENTAL). Requer Editor aberto e Unity 6.0+.
  Fluxo: unity auth login → unity pipeline install → unity status → unity command. Descobrir comandos
  com `unity --help` / `unity command` (os nomes mudam entre versões).
- Superpowers (já instalado; ≥ 7.0.2) = ÚNICA metodologia.
- Git + Git LFS (.aseprite, .psd, áudio) + UnityYAMLMerge como mergetool. .gitignore oficial Unity.
- Opcional, decidir quando surgir a necessidade: Aseprite Importer (se o usuário usar Aseprite);
  Cinemachine + extensão Pixel Perfect (decidir no spike de câmera); Newtonsoft JSON (save).
- Reserva (só com ADR se a CLI falhar): CoplayDev/unity-mcp, fixado em tag, com grupo de geração
  de imagem/modelo/áudio DESLIGADO. Reler os Termos da Unity (§17.2, 30/06/2026) antes.

## 4. NÃO usar
Spec Kit, BMAD, OpenSpec, Kiro (redundantes com Superpowers). MCP do Unity AI Assistant (deprecated).
Addressables, containers de DI, Behavior Graph, SO event channels como fundação. BinaryFormatter.
Geração de arte por IA de qualquer tipo.

## 5. Regras invioláveis (copiar para o CLAUDE.md)
1. Nunca editar como texto: *.unity, *.prefab, *.meta, *.asset, *.controller, *.anim, *.spriteatlasv2.
   Mudar só via APIs do Editor (EditorSceneManager, PrefabUtility, AssetDatabase, SerializedObject,
   Tilemap, AnimatorController), chamadas por `unity command`/eval ou -executeMethod.
2. Nunca apagar/recriar arquivos de arte: sobrescrever bytes no mesmo caminho; renomear só via
   AssetDatabase.MoveAsset. Commitar asset + .meta juntos.
3. Agrupar edições de C#, esperar compilação + console limpo, só então operar cena. Escrita que
   expirou = estado desconhecido: conferir antes de repetir.
4. Nunca declarar "pronto" sem evidência L1–L3 (saída de comando). L4 é do usuário.
5. Uma feature por sessão; sequencial; /clear ao terminar. Escopo explícito (arquivos/pastas).
6. Não "melhorar" decisões registradas em ADR. Não inventar regra de jogo.
7. Feel é dado: velocidades, timings e câmera em ScriptableObjects/campos ajustáveis pelo usuário.
8. Projeto em caminho SEM espaços.

## 6. Organização documental (fonte única)
CLAUDE.md (≤150 linhas: stack, comandos exatos, regras, mapa de docs)
docs/gdd/ (somente leitura) · docs/ARCHITECTURE.md (vivo, ≤2 páginas) · docs/ART_PIPELINE.md (contrato de arte)
docs/ROADMAP.md (fila de features) · docs/decisions/NNNN-*.md (ADRs)
docs/superpowers/specs/ e plans/ (gerados pelo Superpowers; citar GDD por seção, nunca copiar)
.claude/skills/: corvus-unity-check, corvus-art-intake (criar primeiro); corvus-scene-build,
corvus-gap-check (criar quando o padrão se repetir). Checklists vivem DENTRO das skills.
.claude/settings.json: regras deny para Edit/Write nos arquivos da regra 1 (confirmar sintaxe na doc).

## 7. Fluxo de trabalho
Classificar: Nível 0 (correção) → systematic-debugging/edição + check. Nível 1 (feature pequena) →
brainstorming curto → writing-plans → executing-plans → check. Nível 2 (sistema/cena) → brainstorming
completo COM "Manifesto de cena e assets" → aprovação → writing-plans (tarefas [code]/[scene]/[config]/[art])
→ subagent-driven-development ou executing-plans → check → gap-check → code review → L4 → commit.
Spike: time-box, descartável, termina em lição registrada.
Verificação: L1 compilação+console; L2 testes EditMode (e PlayMode); L3 Play Mode curto + sondas
numéricas + screenshot na resolução de referência; L4 aprovação do usuário.
Tarefas [art] bloqueiam as tarefas que dependem delas; liste para o usuário nome canônico, tamanho,
frames e direções exigidos.

## 8. Pipeline de arte (contrato; detalhes no ART_PIPELINE.md)
PPU global = tamanho do tile; Asset PPU da câmera igual. Point, sem compressão, sem mips, Clamp,
pivô Custom em pixels (base-centro p/ personagens/props/prédios; centro p/ tiles), Full Rect.
Nomes: {entidade}_{acao}_{dir}[_{00}], minúsculas ASCII; dirs S,SE,E,NE,N (+ lado W por flipX).
Prédios altos em _base e _teto. Entrega em ArtDrop/ → corvus-art-intake → AssetPostprocessor
(preserva spriteID por nome; nunca apaga frames em silêncio) → validador → commit.
Aseprite (se usado): importador só como fonte de clips; Animator próprio + OverrideController.
PNG: clips gerados por script; atualizar keyframes no .anim existente (preservar GUID).
Sorting: 2D Renderer Data Custom Axis (0,1,0); Sprite Sort Point = Pivot; Sorting Group na raiz
(nos pés); camadas: Chao, Mundo, Sobreposicao, FX, UI. Prédios/árvores = prefabs, não tiles.
Atlas V2 por domínio: Point, sem compressão, padding ≥4, sem rotação/tight.

## 9. Pipeline de cena
Manifesto (finalidade, hierarquia, componentes, prefabs/SOs, assets necessários, critérios visíveis)
→ aprovação → builder idempotente (static + [MenuItem] + [CliCommand]; nomes únicos; "garantir"
assets; AssetEditingScope) → conteúdo ajustável vive em prefabs (Área = Grid + Tilemaps) →
cena só compõe prefabs → layout vem do usuário (pintura no Tile Palette ou PNG de layout convertido
pelo builder) → check L1–L3 → Pacote de entrega: mudanças, evidências, screenshots (incl. sorting
atrás/frente de prédio), o que precisa do olho do usuário, problemas conhecidos, hash do commit.

## 10. Arquitetura mínima
Corvus.Domain (C# puro, testado em EditMode) / Corvus (MonoBehaviours finos) / Corvus.Editor /
Tests.EditMode / Tests.PlayMode — 3 a 5 asmdefs no total. SOs só para definições imutáveis com ID
string. Estado mutável em classes [Serializable]; save JSON com saveVersion. Eventos C# por padrão.
Uma raiz de composição (GameRoot na cena Boot). Aleatoriedade e tempo injetados para testes.

## 11. Comandos de verificação (confirmar nomes com --help)
Editor aberto: `unity status` · `unity command get_console_logs` · `unity test --mode EditMode --junit-output Logs/editmode.xml`
· `unity command editor_play` / `editor_stop` · `unity command screenshot --view game` · `unity command eval --code "..."`
Editor fechado: `Unity.exe -batchmode -projectPath <p> -runTests -testPlatform EditMode -testResults <xml> -logFile <log>`
(sem -quit; ler o XML) · `Unity.exe -batchmode -projectPath <p> -executeMethod <Classe.Metodo> -logFile <log> -accept-apiupdate -quit`

## 12. Checkpoints
Commit antes de cada sessão e após cada verificação verde; .meta sempre juntos; `git status` sem
.meta órfãos. Branch por feature Nível 1–2; tag ao fim de cada fase do slice. Evitar git worktree
com Unity (reimport da Library). ADR para decisão que muda convenção; ARCHITECTURE no mesmo commit.

## 13. Primeiras atividades preparatórias (nesta ordem; parar e reportar a cada uma)
1. Verificar ambiente: versão do Windows, Unity Hub, Editores instalados, git, git-lfs, acesso de rede
   ao registro da Unity e ao instalador da Unity CLI. Reportar o que bloqueia.
2. Confirmar versões atuais: Unity 6 LTS, Unity CLI, com.unity.pipeline, plugin Unity, Superpowers,
   Tilemap Extras, (Aseprite Importer compatível). Registrar no CLAUDE.md.
3. Criar o projeto (usuário cria pelo Hub se preferir): URP 2D, caminho sem espaços; Force Text +
   Visible Meta Files; .gitignore oficial; .gitattributes com LFS; UnityYAMLMerge; primeiro commit.
4. Instalar plugin Unity + CLI + Pipeline; provar: status, eval, screenshot, 1 teste EditMode trivial.
   Se falhar: ADR 0000 e propor fallback.
5. Criar CLAUDE.md v0, ARCHITECTURE.md v0, ART_PIPELINE.md v0 (com campos PPU/tile/resolução EM ABERTO),
   ROADMAP.md, settings.json com regras deny, asmdefs e pastas.
6. Criar skills corvus-unity-check e corvus-art-intake (usar superpowers:writing-skills).
7. Fase 0b — spike de arte: pedir ao usuário 1 personagem com 2 animações + 1 tile; construir
   postprocessor, gerador de clips, validador; ensaiar substituição da arte sem quebrar referências.
8. Fase 0c — spike de câmera com placeholders de cor: Pixel Perfect (Upscale RT), prédio base/teto,
   teste de "subida" da câmera. Usuário decide PPU/tile/resolução/modo → ADR 0001; travar ART_PIPELINE.

## 14. Primeiro Vertical Slice (após a Fase 0)
S1 movimento + câmera · S2 área com tilemaps, colisões, sorting · S3 corvo com animações ·
S4 interação jogador–corvo (lógica testável) · S5 uma interação de ambiente (mesmo sistema de
interação) · S6 ensaio de troca de arte · S7 retrospectiva (ajustar CLAUDE.md/skills).
Aprovado quando: usuário não montou nada no Editor além de layout/feel; toda entrega teve evidência
L1–L3; troca de arte não quebrou nada; cada feature fechou em 1–2 sessões.
NÃO incluir: mapa de províncias, relatório de voo completo, caminhos, capítulos, save.

## 15. Decisões em aberto (perguntar ao usuário quando chegar a hora)
Tamanho de tile e altura de personagem · resolução de referência · Aseprite ou PNG · 4 ou 8 direções
desenhadas · pintura direta de tilemap ou PNG de layout · Cinemachine sim/não · uso de placeholders.
