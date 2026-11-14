Sessão: Corvus · F0a · setup

# HANDOFF — Corvus

Atualizado: 2026-11-14 · Marcador de teste do hook: `corvo-handoff-ok`

Se esta sessão começou por /clear, o hook não renomeia. Se o título não estiver certo, o usuário digita:
`/rename Corvus · F0a · setup`

## O que foi feito
- Teste do hook depois de /clear: marcador chegou. Hook OK.
- Seção 13, etapa 2 (versões): concluída e registrada no CLAUDE.md (seção "Versões"). Resumo: 6000.6.9f1 não
  é LTS (LTS: 6000.3.28f1 / 6000.0.86f1, nenhuma instalada); CLI 1.0.0 e pipeline 1.0.0 são as últimas;
  plugin Unity 0.1.9-beta não instalado; Superpowers 7.0.2 atual; Tilemap Extras/Aseprite dependem do Editor.
- Troca para Unity 6000.3.28f1 LTS (aprovada pelo usuário): editor instalado pela CLI; Assets/, Packages/ e
  ProjectSettings/ substituídos pelos de um projeto-modelo 2D URP novo da 6000.3 (downgrade direto não é
  suportado); productName/productGUID preservados; Library apagada; UnityYAMLMerge apontado para a 6000.3.
  Importação em batchmode: exit 0, sem erros. O modelo já não traz ai.assistant, iet-framework nem Assets/Welcome.
  Commit de checkpoint 4debbde.
- Seção 13, etapa 3 (limpeza do template): removidos com.unity.visualscripting e com.unity.multiplayer.center
  (aprovado pelo usuário). Reimportação: exit 0, sem erros. Commit 8ef5de6.
- Seção 13, etapa 4: plugin Unity 0.1.9-beta instalado no escopo do projeto (33 skills; ~2 mil tokens fixos
  por sessão; as skills só aparecem numa sessão nova). Com o Editor 6000.3.28f1 aberto, provados: status (ready),
  eval (--file), screenshot do game view 480x270 e teste EditMode Corvus.Tests.EditMode.SmokeTest (Passed).
  Comandos que funcionaram registrados no CLAUDE.md. ADR 0000 não foi necessário. Commit 982943e.
- Seção 13, etapa 5: CLAUDE.md reescrito (mapa de docs, papéis, regras invioláveis, fluxo L1–L4, comandos);
  docs/ARCHITECTURE.md, docs/ART_PIPELINE.md (medidas EM ABERTO), docs/ROADMAP.md, docs/decisions/README.md.
  Regras deny Edit(**/*.unity|prefab|meta|asset|controller|anim|spriteatlasv2) no settings.json, testadas
  (escrita recusada). Pastas aprovadas pelo usuário: Assets/Corvus/{Scripts/{Domain,Runtime,Editor},Art,
  Prefabs,Data,Scenes}, Assets/Tests/{EditMode,PlayMode}, ArtDrop/ na raiz fora do git. 5 asmdefs.
  Domain tem IClock, IRandom e SeededRandom; 3 testes EditMode passam; console 0 erros/0 avisos.
  Runtime, Editor e PlayMode ainda sem scripts (a Unity só compila asmdef com código). Commit ac16619.
- Seção 13, etapa 6: skill .claude/skills/corvus-unity-check (SKILL.md + scripts/check-l1l2.ps1 e check-l3.ps1,
  em ASCII). Testada com writing-skills: linha de base sem a skill (13 rodadas de comandos, sem screenshot, mexeu
  no console) vs com a skill (2 scripts, screenshot, relatório no contrato). Scripts provados em verde, em
  vermelho por teste que falha, e no L3 com Play Mode. Caminho de erro de compilação NÃO testado (comando negado).
  corvus-art-intake adiada para o 0b (decisão do usuário).
- Seção 13, etapa 1 (verificar ambiente): concluída. Windows 11 Pro 26300; git 2.54 + git-lfs 3.7.1;
  Unity 6000.6.9f1 (também 6000.4.1f1); Unity CLI 1.0.0 logada; com.unity.pipeline 1.0.0 já no projeto;
  registro de pacotes da Unity acessível. Unity Hub não encontrado nos caminhos padrão.
- Git: repositório próprio em C:\Users\User\project_c, remoto github.com/AntonioBudal/project_c.
  .gitignore Unity (inclui .claude/), .gitattributes com LFS (.aseprite, .psd, áudio, fontes) e
  UnityYAMLMerge configurado localmente.
- GDD copiado sem alterações para docs/gdd/corvus-conceito.md (somente leitura).
- CLAUDE.md criado (Design, Git, Sessões, Economia de contexto, Compact instructions).
- Hook SessionStart (startup|clear|compact) que injeta este arquivo; roda via powershell.exe.
  Também define o título da sessão a partir da linha "Sessão:" (só em startup/resume/fork, limite do Claude Code).
- Pacote de transferência salvo em docs/pacote-transferencia.md (Seções 0–15). É a referência de método.
- Padrão de nome de sessão "Corvus · <etapa> · <tipo>" registrado no CLAUDE.md.
- .gitignore passou a versionar .claude/settings.json e .claude/hooks/ (só settings.local.json fica fora).

## Branch e commits
- Branch atual: `feature/fase0-setup` (local, não enviada).
- main = origin/main = `785f05c F01 - cria o projeto Unity e configura o git` (já no GitHub; não alterar).
- Commit de checkpoint local (aprovado pelo usuário) na branch com CLAUDE.md, GDD, pacote, HANDOFF,
  .gitignore e .claude/ (settings + hook). Não enviado ao GitHub.
- Ao fim da Fase 0a: squash na main como `feat(setup): documentação inicial e passagem entre sessões`,
  apagar a branch. Push só com aprovação.

## Próximo passo exato
Fase 0a concluída. Fazer o squash de feature/fase0-setup na main como
`feat(setup): documentação inicial e passagem entre sessões` (finishing-a-development-branch, sempre squash),
apagar a branch e pedir aprovação para o push. Depois: nova sessão "Corvus · F0b · arte" para o spike de arte
(pedir ao usuário 1 personagem com 2 animações + 1 tile; decidir Aseprite ou PNG e 4 ou 8 direções).

## Decisões pendentes do usuário
- CLAUDE.md vai para o GitHub (hoje sim) ou fica local?
- PRIMEIRO PROTÓTIPO (decisão do usuário, em aberto): o GDD ("Riscos e o que prototipar") diz que o
  primeiro protótipo deve ser o relato de voo; o slice do pacote (Seção 14) o exclui. Decidir antes do
  Vertical Slice. O spike de câmera 0c já cobre a câmera que sobe com a ave.

## Arquivos relevantes
CLAUDE.md · docs/gdd/corvus-conceito.md · docs/pacote-transferencia.md (método; Seção 13 = Fase 0) ·
.claude/settings.json · .claude/hooks/session-start-handoff.ps1 · Packages/manifest.json · .gitignore · .gitattributes
