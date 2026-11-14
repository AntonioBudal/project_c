# ART_PIPELINE — Corvus (v0)

Contrato entre a arte do usuário e o projeto. Origem: pacote de transferência, Seção 8.
Os campos marcados EM ABERTO são decididos pelo usuário no spike de câmera (Fase 0c) e registrados no ADR 0001.
Depois disso este documento trava; mudar exige novo ADR.

## Medidas — EM ABERTO
| Campo | Valor | Decide em |
|---|---|---|
| Tamanho do tile (px) | EM ABERTO | 0c |
| PPU global (= tamanho do tile) | EM ABERTO | 0c |
| Altura do personagem (px) | EM ABERTO | 0c |
| Resolução de referência | EM ABERTO | 0c |
| Modo da Pixel Perfect Camera (Upscale RT etc.) | EM ABERTO | 0c |
| Direções desenhadas (4 ou 8) | EM ABERTO | 0b |
| Formato de entrega (Aseprite ou PNG) | EM ABERTO | 0b |
| Layout de área (pintura no Tile Palette ou PNG de layout) | EM ABERTO | S2 |

## Importação (fixo)
- Filter Point, sem compressão, sem mipmaps, Wrap Clamp, Mesh Type Full Rect.
- PPU global igual ao tamanho do tile; Asset PPU da Pixel Perfect Camera igual.
- Pivô Custom em pixels: base-centro para personagens, props e prédios; centro para tiles.

## Nomes
- `{entidade}_{acao}_{dir}[_{00}]`, minúsculas ASCII, sem espaços. Ex.: `corvo_voar_se_03`.
- Direções: `s`, `se`, `e`, `ne`, `n`. O lado W vem de flipX.
- Prédios altos em duas partes: `_base` e `_teto`.

## Entrega
1. O usuário coloca os arquivos em `ArtDrop/` (raiz do projeto, fora do git).
2. Skill `corvus-art-intake` copia para `Assets/Corvus/Art/`, sobrescrevendo bytes no mesmo caminho.
3. AssetPostprocessor aplica as regras de import; preserva spriteID por nome; nunca apaga frames em silêncio.
4. Validador confere nomes, tamanhos, pivôs e frames. Falha = relatório ao usuário, sem import parcial.
5. Commit de asset + .meta juntos.

## Animação
- Aseprite (se usado): o importador serve só como fonte de clips; Animator próprio + AnimatorOverrideController.
- PNG: clips gerados por script; atualizar keyframes no .anim existente (preserva o GUID).

## Sorting
- 2D Renderer Data: Transparency Sort Mode Custom Axis (0, 1, 0).
- Sprite Sort Point = Pivot. Sorting Group na raiz do objeto, com o pivô nos pés.
- Camadas: `Chao`, `Mundo`, `Sobreposicao`, `FX`, `UI`.
- Prédios e árvores são prefabs, não tiles.

## Atlas
- Sprite Atlas V2 por domínio. Point, sem compressão, padding ≥ 4, sem rotação, sem tight packing.
