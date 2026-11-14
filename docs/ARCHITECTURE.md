# ARCHITECTURE — Corvus (v0)

Documento vivo, no máximo 2 páginas. Mudança de convenção exige ADR em docs/decisions/ no mesmo commit.
Origem: pacote de transferência, Seção 10.

## Assemblies (5)
| asmdef | Pasta | Referencia | Conteúdo |
|---|---|---|---|
| Corvus.Domain | Assets/Corvus/Scripts/Domain | nada (noEngineReferences) | Regras do jogo em C# puro. Testado em EditMode. |
| Corvus | Assets/Corvus/Scripts/Runtime | Corvus.Domain | MonoBehaviours finos: leem input, chamam o Domain, mostram o resultado. |
| Corvus.Editor | Assets/Corvus/Scripts/Editor | Corvus, Corvus.Domain | Builders de cena, importadores, validadores, comandos de CLI. Só Editor. |
| Corvus.Tests.EditMode | Assets/Tests/EditMode | Corvus.Domain, Corvus | Testes NUnit rápidos, sem cena. |
| Corvus.Tests.PlayMode | Assets/Tests/PlayMode | Corvus.Domain, Corvus | Testes que precisam do loop da Unity. |

Regra: o Domain não conhece a Unity. Se uma regra do jogo precisa de UnityEngine, ela está no lugar errado.

## Pastas
```
Assets/Corvus/Scripts/{Domain,Runtime,Editor}
Assets/Corvus/Art/        sprites importados (só pelo corvus-art-intake)
Assets/Corvus/Prefabs/    conteúdo ajustável (Área = Grid + Tilemaps; prédios; personagens)
Assets/Corvus/Data/       ScriptableObjects de definição
Assets/Corvus/Scenes/     Boot e cenas de área (só compõem prefabs)
Assets/Tests/{EditMode,PlayMode}
ArtDrop/                  entrega de arte do usuário (raiz do projeto, fora do git)
```
Namespaces seguem o asmdef: `Corvus.Domain.*`, `Corvus.*`, `Corvus.Editor.*`, `Corvus.Tests.*`.

## Padrões
- ScriptableObjects só para definições imutáveis, cada uma com ID string estável.
- Estado mutável em classes `[Serializable]` do Domain. Save em JSON com `saveVersion` (fora do slice).
- Comunicação por eventos C# (`event Action<T>`). Sem SO event channels, sem containers de DI.
- Uma raiz de composição: `GameRoot` na cena Boot cria e liga os serviços.
- Aleatoriedade e tempo injetados (interfaces no Domain) para que os testes sejam determinísticos.
- Feel (velocidades, timings, câmera) em SOs ou campos serializados que o usuário ajusta.

## Não usar
Addressables, containers de DI, Behavior Graph, SO event channels como fundação, BinaryFormatter,
MCP do Unity AI Assistant, geração de arte por IA.

## Ferramentas de Editor
Builders de cena são idempotentes: `static` + `[MenuItem]` + comando de CLI, nomes únicos, "garantir" assets
em vez de recriar, dentro de `AssetDatabase.StartAssetEditing` / `StopAssetEditing`.
