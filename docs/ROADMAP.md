# ROADMAP — Corvus

Fila de trabalho. Uma feature por vez, cada uma numa branch `feature/<nome>`, fechada em 1–2 sessões.
Detalhes de cada fase: pacote de transferência, Seções 13 e 14.

## Fase 0 — preparação
- [x] 0a.1 Verificar ambiente
- [x] 0a.2 Confirmar versões (troca para 6000.3.28f1 LTS)
- [x] 0a.3 Projeto URP 2D, git, LFS, UnityYAMLMerge; limpeza do template
- [x] 0a.4 Plugin Unity + CLI + Pipeline; status/eval/screenshot/teste EditMode provados
- [x] 0a.5 CLAUDE.md, ARCHITECTURE, ART_PIPELINE, ROADMAP, regras deny, asmdefs e pastas
- [x] 0a.6 Skill `corvus-unity-check` (testada com subagente: linha de base e com a skill).
      `corvus-art-intake` adiada para o 0b por decisão do usuário: nasce junto com as ferramentas que usa.
- [ ] 0b Spike de arte: 1 personagem com 2 animações + 1 tile do usuário; postprocessor, gerador de clips,
      validador; skill `corvus-art-intake` (writing-skills); ensaio de troca de arte sem quebrar referências
- [ ] 0c Spike de câmera com placeholders de cor: Pixel Perfect (Upscale RT), prédio base/teto, "subida" da
      câmera. Usuário decide PPU/tile/resolução/modo → ADR 0001; travar ART_PIPELINE

## Vertical Slice
- [ ] S1 Movimento + câmera
- [ ] S2 Área com tilemaps, colisões e sorting
- [ ] S3 Corvo com animações
- [ ] S4 Interação jogador–corvo (lógica testável no Domain)
- [ ] S5 Uma interação de ambiente (mesmo sistema de interação)
- [ ] S6 Ensaio de troca de arte
- [ ] S7 Retrospectiva: ajustar CLAUDE.md e skills

Aprovado quando: o usuário não montou nada no Editor além de layout e feel; toda entrega teve evidência L1–L3;
a troca de arte não quebrou nada; cada feature fechou em 1–2 sessões.
Fora do slice: mapa de províncias, relatório de voo completo, caminhos, capítulos, save.

## Decisões em aberto
- Primeiro protótipo: o GDD ("Riscos e o que prototipar") pede o relatório de voo primeiro; o slice o exclui.
  Decidir antes de S1. O spike 0c já cobre a câmera que sobe com a ave.
- Tamanho de tile e altura de personagem · resolução de referência · Aseprite ou PNG · 4 ou 8 direções ·
  pintura de tilemap ou PNG de layout · Cinemachine sim/não · uso de placeholders.
