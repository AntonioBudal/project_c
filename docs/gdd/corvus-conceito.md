# Corvus: documento de conceito

Nov 13, 2026 · @Antônio Budal Arins de LIma

## Como ler este documento

Este é o conceito do Corvus construído na fase de descoberta, aguardando sua validação. Ele não define arquitetura, ferramentas nem tarefas de implementação.

- **Decisão**: algo que você definiu durante a discussão.
- **Proposta**: sugestão do Claude, ainda não aprovada. Pode ser cortada ou mudada.
- **Fato** e **ficção**: nas partes históricas e biológicas, separam o que é documentado do que é liberdade do jogo.

## Premissa e identidade

Corvus (nome provisório) é um jogo de jornada e expansão em pixel art, na Unity, sobre o líder de uma irmandade medieval que cria, treina e conhece corvídeos e, por meio deles, constrói um império de comunicação no Báltico oriental a partir de 1298.

- **Decisão:** a irmandade é fictícia e está ligada à estrutura religiosa e hospitalar da Ordem Teutônica, com identidade e finalidade próprias.
- **Decisão:** a campanha começa fiel à história, e a conquista do jogador muda a história como a conhecemos.
- **Decisão:** em certo momento, o jogador escolhe de forma irreversível entre o Caminho da Espada e o Caminho da Comunicação.
- **Origem da ideia:** o fascínio por corvos e pela origem da consciência, e a hipótese de que corvos vivendo junto aos humanos poderiam desenvolver uma proto-consciência ao longo de milhões de anos. A irmandade medieval é o começo ficcional dessa trajetória.

O que torna o Corvus diferente: os companheiros animais não são ferramentas obedientes. A informação que trazem passa pela atenção de cada indivíduo, e o que a irmandade sabe está guardado na linhagem das aves.

## Fantasia central

**Decisão:** ser um conquistador sem uma gota de sangue, que vê o mapa ganhar sua cor apenas por meio da comunicação.

O jogador sente duas coisas ao mesmo tempo (**decisão**):

1. A proximidade de quem conhece, treina e convive com cada ave, durante as viagens.
2. A grandiosidade de ver cidades conectadas e fronteiras atravessadas, percebida nas consequências no mapa.

A expansão não é benevolente (**decisão**). Ao conectar comunidades, a irmandade muda relações de poder, costumes, autonomia e a forma como as pessoas entendem o mundo. O jogador deve sentir o fascínio de construir algo poderoso mesmo quando as consequências não são todas positivas.

A escolha institucional dá à fantasia duas formas (**proposta** para os nomes):

- **Espada, o poder que ninguém vê:** ser indispensável para a instituição mais poderosa da região. O líder não derrama sangue com as próprias mãos, mas outros derramam graças ao que ele sabe.
- **Comunicação, o fundador de algo próprio:** soberania. A cor é da irmandade, e cada ponto da rede existe porque o líder foi até lá.

## Pilares de design

Cinco pilares (**proposta** de redação: cada um vem de algo que você disse; a forma de escrever é minha). Uma mecânica que não serve a pelo menos um deles não entra.

1. **Compreender, não comandar.** As aves são indivíduos com atenção, temperamento e memória. O jogador progride aprendendo quem elas são, não dando ordens melhores.
2. **A presença do líder move o mundo.** A irmandade cresce porque o líder vai até os lugares. A jornada pessoal e a expansão são uma só experiência vista de perto e de longe.
3. **Poucas decisões, consequências visíveis.** Como no Frostpunk: opções claras e o jogador sempre entende por que o mundo mudou. Nada de dezenas de variáveis.
4. **A história dá autenticidade, não burocracia.** Cidades, povos e acontecimentos reais, sem simular cada detalhe, evitando o excesso de sistemas criticado em Europa Universalis V.
5. **Todo poder tem preço.** Nenhum caminho é a escolha moral óbvia. A Espada alimenta a guerra; a Comunicação cria dependência.

## Abordagens consideradas

Três formas de jogo foram consideradas, e você escolheu a terceira.

| Forma | O que é | Por que foi ou não escolhida |
| --- | --- | --- |
| Estratégia vista de cima | O jogador administra a irmandade pelo mapa; aves são linhagens com traços | Descartada: troca a jornada pessoal por um painel e puxa para o grand strategy burocrático |
| Só o emissário no chão | Aventura pessoal com poucas aves, sem camada territorial forte | Descartada: perde a fantasia de pintar o mapa e de construir um império |
| A jornada do líder como motor da expansão | O líder viaja com as aves; como elas aprendem por presença, a viagem dele faz a irmandade crescer, e o mapa mostra a consequência | **Escolhida.** Única forma que une proximidade com as aves e conquista territorial |

Dentro da forma escolhida, você também rejeitou uma tensão contínua entre espada e comunicação (uma barra de militarização ou um controle deslizante de autonomia). No lugar dela, uma decisão institucional irreversível, ao estilo da escolha entre Ordem e Fé no Frostpunk.

## Gênero e estrutura da campanha

Uma campanha de jornada e expansão que pode atravessar séculos, contada em capítulos, um por líder, e encerrada com a conquista completa do Báltico.

- **Gênero:** não é grand strategy, city builder nem RTS (**decisão**). É uma aventura de viagem e relações com uma camada territorial visível, mais próxima de Frostpunk e The Banner Saga do que de Europa Universalis.
- **Capítulos (decisão):** cada líder é um capítulo. Na sucessão o tempo salta anos ou décadas. O novo líder herda a irmandade, a rede, as escolhas e as aves descendentes das anteriores.
- **Início (decisão):** a campanha começa fiel à história, por volta de 1298.
- **A escolha institucional (decisão):** o Grão-Mestre exige colocar a irmandade a serviço das campanhas militares. Aceitar leva ao Caminho da Espada; recusar, ao da Comunicação. A escolha é irreversível.
- **Quando ela acontece (proposta):** depois que o jogador já criou vínculos com as aves e com algumas cidades. Por exemplo, logo após a tomada de Danzig pela Ordem em 1308, para que o pedido chegue quando o jogador acabou de ver o que a espada faz.
- **História alternativa (decisão):** onde o jogador não interfere, o mundo segue a história real. Onde ele conquista, a história muda.
- **Final (decisão):** a conquista completa do Báltico. Na Espada, o Báltico pintado com a cor teutônica graças à irmandade. Na Comunicação, o Báltico inteiro dentro da esfera de influência da irmandade.
- **Extremos opcionais (proposta, inspirada nos extremos de Ordem e Fé do Frostpunk):** na Espada, a irmandade passa a vigiar a própria população cristã. Na Comunicação, a rede passa a governar as comunidades em vez de servi-las.

**Derrota (decisão):** a campanha pode terminar antes da vitória, como no Frostpunk. Depois da escolha institucional, cada caminho tem duas barras próprias; se uma delas chegar ao limite, o jogo acaba. Essas barras medem a sobrevivência da irmandade e são diferentes da barra de militarização descartada, que misturaria os caminhos. **Proposta** para o que elas medem: na Espada, a confiança da Ordem e a suspeita da população vigiada; na Comunicação, a confiança das comunidades e a vulnerabilidade da irmandade sem proteção.

**Sucessão (decisão):** o líder morre e é sucedido. Na primeira versão, a morte acontece apenas pela passagem do tempo.

## Ciclo central

Toda cidade passa pelo mesmo ciclo, e o relato de voo é o seu centro.

&#91;embedded content: ciclo de uma cidade · 7 etapas\]

- **Viagem (decisão):** o jogador escolhe o destino, e a viagem é uma sequência curta de eventos e decisões, como a ponte caída, os batedores lituanos ou a ave que encontrou algo no caminho.
- **Chegada (proposta):** as aves voam antes do líder, e a primeira imagem da cidade é vista do alto.
- **Relato de voo (decisão):** o jogador vê o que a ave viu, sem controlar o voo, filtrado pela atenção daquela ave. Com o tempo, aprende quem mandar para quê.
- **Ler a cidade (proposta):** cada cidade tem uma situação particular e quatro ou cinco personagens. O jogador responde a três perguntas: quem manda, quem sabe e o que está acontecendo. Nada de painel administrativo (**decisão**).
- **Agir (decisão):** as ações dependem do caminho escolhido.
- **Consequência (proposta):** ao sair, o mapa se anima e mostra o que mudou.

**Exemplo, Dorpat por volta de 1300.** Fatos: principado episcopal desde 1224, fortaleza do bispo sobre o antigo forte estoniano, catedral em obras, claustro dominicano, abadia cisterciense de Kärkna, membro da Hansa desde os anos 1280 e ponte comercial com Pskov. Ficção (**proposta**): o bispo quer preservar a independência diante da Ordem, os mercadores dependem da rota de Pskov, e a obra da catedral consome recursos. Personagens em funções reais: o oficial do bispo, um mercador do conselho, o prior dominicano, um mercador de Pskov e um ancião estoniano que pesca no Emajõgi.

## Os dois caminhos

A escolha muda o que o jogador faz na maior parte da partida, não apenas os bônus (**decisão**). Viajar, conhecer e treinar as aves, criar relações e explorar continuam iguais nos dois caminhos; o que muda é o sentido dessas atividades.

**O preço (decisão):**

- **Espada:** a irmandade preserva a identidade (liderança, tradições, insígnia) e abre mão da independência. Ganha proteção, recursos e acesso à estrutura militar, e constrói o poder territorial da Ordem Teutônica. Faz trabalhos extraordinários sem o reconhecimento ou a autonomia que teria construindo o próprio império.
- **Comunicação:** a irmandade preserva a independência e constrói a própria esfera de influência, mas perde a proteção e o apoio da instituição mais poderosa da região.

**As diferenças (proposta, a partir das suas descrições):**

|  | Espada | Comunicação |
| --- | --- | --- |
| Objetivo ao chegar numa cidade | Obter informações estratégicas para a Ordem | Criar uma relação e um ponto da rede |
| Primeiras ações | Observar fortificações e portões; seguir guardas e mensageiros; reconhecer rotas e passagens pouco vigiadas | Carta formal pedindo audiência; demonstrar as aves; buscar outra porta (comerciantes, religiosos, moradores) se houver recusa |
| Treinamento das aves | Observar sem ser visto, reconhecer indivíduos e padrões | Vínculo com tratadores locais, rotas entre pessoas conhecidas |
| Pessoas importantes | Comandantes, informantes, batedores que servem aos dois lados | Tratadores, autoridades locais, mercadores, clérigos, líderes pagãos |
| O que ameaça o jogador | Ser descoberto, contraespionagem, aves mortas | Perder a proteção, ser visto como colaborador dos pagãos |
| Progressão | Acesso e confiança dentro da Ordem; segredos maiores | Alcance e profundidade da própria rede |
| Sombra moral | A informação vira sangue | A conexão vira dependência |

**Para nenhum caminho ser o "mau" (proposta):** na Espada, a informação também protege. Os lituanos também atacavam (em 1298 tomaram e saquearam o castelo de Karkus), e uma ave que avisa uma aldeia salva vidas. Na Espada, a crônica oficial de Pedro de Dusburg (escrita em Königsberg entre 1324 e 1330) registra vitórias que dependeram da irmandade sem mencioná-la.

**A Ordem depois da recusa (decisão):** no Caminho da Comunicação, a Ordem Teutônica deixa de ajudar e de proteger a irmandade, mas não a persegue.

## Corvídeos, indivíduos e rede

As aves são indivíduos, não unidades, e o conhecimento da irmandade está guardado nelas.

**Nível de licença biológica (decisão): moderado.** As linhagens da irmandade conseguem voar entre pessoas e lugares que conhecem bem, mas só depois de treino presencial em cada ponto, com falhas e personalidades interferindo. Corvos não viram pombos-correio.

**A escada de capacidades (proposta, a partir da sua hipótese de progressão):**

| Estágio | Base real | Status |
| --- | --- | --- |
| Observar e voltar ao tratador | Corvídeos aprendem por recompensa e reconhecem quem os alimenta | Fato |
| Levar e depositar pequenos objetos | Gralhas-calvas treinadas no parque Puy du Fou recolhiam lixo em troca de comida | Fato, com aves cativas |
| Aprender rostos e ensinar outras aves | Estudos de Marzluff: o reconhecimento passa de pais para filhotes e entre membros do bando | Fato |
| Rotas recorrentes entre pessoas conhecidas | Exagero do apego a pessoas e territórios | Ficção (licença moderada) |
| Dormitório como central de notícias | Dormitórios de corvos funcionam como centrais de informação sobre comida (Marzluff e Heinrich) | Inspirado em fato |

Um limite real vira mecânica: aves soltas têm muitas outras recompensas que as afastam da tarefa. Por isso a rede nunca é perfeita, e a personalidade de cada ave tem consequência.

**A rede tem só três elementos (proposta):**

- **Aves:** nome, espécie, um ou dois traços de temperamento e o que conhecem (rostos, lugares, rotas).
- **Tratadores:** pessoas em cada cidade que as aves reconhecem.
- **Rotas:** dois tratadores mais as aves que conhecem os dois. Uma rota é tão forte quanto as aves que a conhecem; nenhum número de "força".

**O conhecimento mora na linhagem (proposta):** aves jovens aprendem rostos e rotas com as velhas. A progressão da irmandade é a própria linhagem: perder uma ave experiente é perder conhecimento. Na sucessão de líderes, as aves descendentes são a continuidade emocional da campanha.

**Espécies por paisagem (proposta, com base na distribuição real):** gralha-cinzenta (cidades, o ano inteiro), gralha-calva (colônias em campos cultivados, sazonal), gralha-de-nuca-cinzenta (torres e muralhas), corvo (florestas e distâncias), gaio (bosques). Cada espécie abre um tipo de lugar.

## Mapa de províncias

O mapa usa a linguagem visual dos grand strategies, sem a simulação: cada província é uma unidade visual que se preenche, se contorna e se anima, e não uma unidade administrativa (**decisão**).

**Duas camadas no mesmo polígono:**

- **Soberania política:** cor sólida de preenchimento, de quem governa (**decisão**).
- **Influência da irmandade:** uma camada por cima, na cor da irmandade, que não apaga a cor de baixo (**decisão**). A forma visual, como hachura, contorno interno ou brilho na borda, é **proposta**.
- **Insígnia dos corvos** onde há presença física, e **rotas** como linhas entre cidades (**proposta**).
- **Na Espada:** as províncias conquistadas recebem a cor teutônica, e a insígnia mostra a presença da irmandade (**decisão**).
- **Na Comunicação:** as províncias continuam das autoridades locais e recebem a camada de influência da irmandade (**decisão**).

**Estados das províncias (decisão), com a aparência como proposta:**

| Estado | Como aparece |
| --- | --- |
| Desconhecida | Pergaminho em branco, sem fronteiras nem nome |
| Conhecida | Geografia e cor política visíveis |
| Presença estabelecida | Insígnia dos corvos e início da camada de influência |
| Integrada | Espada: cor teutônica. Comunicação: influência cobrindo a província |

**Regras de design (proposta):**

1. Uma província não tem números: só nome, autoridade, estado e, no máximo, um lugar visitável.
2. Ela só muda de estado por um momento que o jogador viu: chegada, decisão ou evento. Mesmo o que as aves espalham sozinhas aparece como evento.
3. O mapa é a tela da consequência: ao sair de uma cidade, ele se anima.
4. Nem toda província tem cena visitável; muitas se integram por eventos ou pela rede vizinha.
5. No máximo um ou dois modos de mapa.
6. Onde o jogador não interferiu, as fronteiras mudam conforme a história real, ano a ano (**decisão**: o mapa mostra mudanças conforme o ano).

**Influência e mudança de soberano (proposta):** na Comunicação, a camada de influência sobrevive quando a província muda de dono. Se a Ordem conquistar uma região integrada à rede, a cor de baixo muda e a influência continua por cima, a menos que um evento a destrua.

## Ambientação e direção narrativa

O Báltico oriental a partir do fim do século XIII, com cidades, instituições e povos reais, e uma única grande ficção: a irmandade dos corvos.

**Região e período (decisão):** Prússia, Livônia e Lituânia, a partir do final do século XIII. Cidades citadas por você: Riga, Reval (Tallinn), Dorpat (Tartu), Danzig (Gdańsk) e Königsberg. A região não é homogênea: cada povo e cada cidade tem identidade própria.

**Fatos que dão textura ao mundo (pesquisados):**

| Lugar | Por volta de 1300 |
| --- | --- |
| Riga | Em guerra com a Ordem Livoniana desde 1297; aliada à Lituânia pagã em 1298 |
| Reval | Capital da Estônia dinamarquesa até 1346; ponte comercial com Novgorod |
| Dorpat | Principado episcopal desde 1224, na Hansa desde os anos 1280; ponte com Pskov; catedral em obras sobre o antigo forte estoniano |
| Danzig | Tomada pela Ordem Teutônica em novembro de 1308, com massacre dos habitantes |
| Königsberg | Fundada em 1255 sobre o forte prussiano de Twangste; base das campanhas contra a Lituânia |
| Vilnius | Em 1323, o pagão Gediminas convida mercadores, artesãos e frades a se instalarem |

**Povos:** prussianos, curônios, semigálios, latgálios, livônios, estonianos, lituanos, samogícios, russos de Novgorod e Pskov, alemães, dinamarqueses, poloneses e cassúbios. As populações locais têm culturas, crenças e organizações próprias e não são retratadas como ignorantes ou antagonistas (**decisão**).

**A irmandade (decisão):** fictícia, ligada à estrutura religiosa ou hospitalar da Ordem Teutônica. Não é oposição à Ordem: é a outra opção, o outro lado da moeda que não é a espada. Nasce de uma visão religiosa, e o jogo nunca decide se ela era divina, um engano ou algo sobrenatural. A visão de mundo dos personagens não precisa corresponder à verdade do jogo.

**Origem (proposta):** a irmandade nasce no hospital da Ordem em Acre, por volta de 1190, antes da militarização de 1198. Ela é o que a Ordem era antes de virar espada. Isso segue um padrão real: no Báltico, missões pacíficas (Meinhard na Livônia, Cristiano de Oliva na Prússia) vieram antes das ordens militares, e ordens pequenas (Dobrzyń em 1235, Irmãos da Espada em 1237) foram absorvidas pela Ordem Teutônica.

**História alternativa (decisão):** a campanha começa fiel. A conquista do jogador, em qualquer caminho, muda a história. Na Espada isso inclui um desfecho em que a Ordem vence onde historicamente foi derrotada (Grunwald, 1410).

**Divisões do mapa (proposta):** territórios e jurisdições da época, simplificados, nunca as fronteiras modernas. Na Prússia, as antigas terras tribais listadas por Dusburg (Sâmbia, Natângia, Pomesânia e outras), para que o mapa lembre quem estava ali antes. Na Livônia, o arcebispado de Riga, os bispados e as terras da Ordem Livoniana. A Estônia dinamarquesa (Hárria e Virônia). Na Lituânia, a Samogícia e o núcleo lituano. A faixa despovoada entre a Ordem e a Lituânia como uma província sem cor política: terra de ninguém e terra de corvos.

## Direção visual e perspectiva

Pixel art 2D com o líder em terceira pessoa, cidades vistas de cima em 3/4 e um mapa de províncias para a escala territorial.

| Momento | Apresentação | Status |
| --- | --- | --- |
| Cidades e regiões visitadas | Pixel art 2D, vista de cima em 3/4, líder em terceira pessoa | Decisão |
| Escala territorial | Mapa de províncias com preenchimentos, contornos, insígnias e rotas | Decisão |
| Viagem entre cidades | Escolha do destino e uma sequência curta de eventos na estrada, como em The Banner Saga | Decisão |
| Relato de voo | O jogador vê o que a ave viu, sem controlar, filtrado pela atenção dela | Decisão |
| Como o relato é mostrado | A câmera sobe com a ave e mostra a mesma cidade vista do alto; a curiosa se demora em objetos brilhantes, a medrosa passa rápido pelas muralhas | Proposta |
| Chegada a uma cidade | Uma imagem ampla quando o líder avista a cidade (Dorpat: a colina com a catedral inacabada sobre o rio), compensando a perda de silhueta da vista de cima | Proposta |

Referências citadas: Frostpunk pela identidade visual imediata dos cenários; The Banner Saga para a viagem; Eastward como exemplo de pixel art vista de cima em 3/4 (**proposta**).

## Progressão e objetivos

A progressão é sentida no crescimento do bando, no conhecimento sobre as aves, nas relações estabelecidas e na expansão geográfica, não em atributos ou árvores de tecnologia (**decisão**).

- **Novas maneiras de agir (decisão):** cada nova capacidade das aves permite uma ação que antes não existia, ou muda bastante uma estratégia. Começa-se com poucas ações.
- **Começo limitado (decisão):** na origem, o conhecimento da irmandade é pequeno, e o jogador descobre aos poucos como aproveitar as características naturais das aves.
- **Sistemas reaproveitados (decisão):** a mesma estrutura de jogo vale em todas as cidades, mas cada lugar traz circunstâncias, personagens e oportunidades diferentes.
- **Evolução das ações (proposta):** na Espada, de observar, seguir e percorrer para reconhecer indivíduos, comparar dias, rastrear mensageiros e sinalizar para forças em campo. Na Comunicação, de escrever, demonstrar e buscar outras portas para formar tratadores, levar objetos, estabelecer rotas e fundar dormitórios.
- **Objetivo de curto prazo:** integrar a cidade ou a região atual. **Objetivo de médio prazo:** atravessar a escolha institucional e preparar a sucessão. **Objetivo final (decisão):** a conquista completa do Báltico. Os dois primeiros níveis são **proposta**.

**Antes da escolha institucional (proposta):** o jogador tem as ações comuns aos dois caminhos: observar e voltar, levar pequenos objetos entre pessoas conhecidas e apresentar as aves a alguém. Assim ele aprende a ler as aves antes que o objetivo se divida.

## Fora do escopo

O que o Corvus não é e não terá.

**Decisões suas:**

- Nenhuma administração de províncias: sem população, economia, produção, impostos, construções ou políticas locais.
- Não é city builder, RTS nem grand strategy.
- Sem dezenas de habilidades, atributos, árvores de tecnologia ou recursos administrativos.
- Sem barra de militarização, controle de autonomia ou mistura gradual entre os caminhos.
- Sem bônus percentuais como diferença entre os caminhos.
- Sem cidades transformadas em simuladores diplomáticos ou militares.
- As aves não são unidades intercambiáveis, não são combatentes e não revelam tudo instantaneamente.
- O jogador não controla o voo das aves.
- IA generativa não é obrigação de arquitetura; só entra com justificativa real.
- Corvos não são pombos-correio confiáveis.

**Propostas:**

- O líder não luta diretamente. O conflito acontece por informação, relações e decisões.
- O conceito não depende de modelos de linguagem. O comportamento das aves cabe em sistemas determinísticos com memória de eventos, a avaliar na próxima fase.

## Riscos e o que prototipar

O relato de voo é a ideia mais original e o maior risco; ele deve ser o primeiro protótipo.

| Risco | Por que importa | O que prototipar primeiro |
| --- | --- | --- |
| Relato de voo ilegível ou sem personalidade | É o coração do pilar "compreender, não comandar" | Uma cidade, duas aves de temperamentos opostos, a mesma missão: o jogador percebe a diferença e decide melhor por causa dela? |
| Dois caminhos viram dois jogos | Dobra o custo de conteúdo | Uma cidade jogada nos dois caminhos com as mesmas ações básicas e objetivos diferentes |
| Autonomia das aves parecer aleatoriedade | Comportamento independente é lido como defeito se não tiver causa visível | Aves com um ou dois traços e memória de eventos: o jogador consegue prever o que cada uma fará? |
| Linhagem e sucessão sem peso emocional | A continuidade entre capítulos depende das aves | Uma passagem de capítulo com uma ave descendente que lembra uma rota antiga |
| Mapa de províncias virar painel | Puxa o jogo para o grand strategy que se quer evitar | A animação de consequência ao sair de uma cidade, com duas camadas (soberania e influência) |
| Escopo da campanha de séculos | Muitas cidades, eventos e capítulos | Um corte vertical: Dorpat e mais duas cidades, uma escolha institucional, um capítulo |
| Sensibilidade histórica | Povos reais com herdeiros vivos (lituanos, estonianos, letões); fontes sobre a religião báltica são escassas e tardias | Pesquisa antes de escrever crenças locais; nada de mitologia inventada atribuída a um povo real |

## Em aberto

O que ainda falta decidir, em ordem de impacto.

- [ ] Validar as propostas marcadas neste documento.
- [ ] Em que momento exato ocorre a escolha institucional (a tomada de Danzig, em 1308, é a sugestão).
- [ ] O que exatamente medem as duas barras de cada caminho e o que as faz subir e descer.
- [ ] Quantos capítulos (líderes) uma campanha típica tem.
- [ ] O termo que a irmandade usa para a "consciência" das aves: anima, memoria ou um nome criado pela própria irmandade.
- [ ] O nome definitivo do jogo e da irmandade.
- [ ] Como corvídeos aparecem nas crenças bálticas (exige pesquisa antes de qualquer uso).
- [ ] Próxima fase, separada: o fluxo de desenvolvimento com Claude, Unity e ferramentas de especificação (GitHub Spec Kit ou alternativa), incluindo a avaliação de IA para o comportamento das aves.

## Fontes

Fontes consultadas durante a descoberta:

- [Timeline of Riga](https://en.wikipedia.org/wiki/Timeline_of_Riga) e [Battle of Turaida](https://en.wikipedia.org/wiki/Battle_of_Turaida): guerra de Riga com a Ordem Livoniana e aliança com a Lituânia
- [Letters of Gediminas](https://en.wikipedia.org/wiki/Letters_of_Gediminas): convites de 1323
- [Duchy of Estonia (1219–1346)](<https://en.wikipedia.org/wiki/Duchy_of_Estonia_(1219%E2%80%931346)>): Reval dinamarquesa
- [Bishopric of Dorpat](https://en.wikipedia.org/wiki/Bishopric_of_Dorpat) e [Tartu Cathedral](https://en.wikipedia.org/wiki/Tartu_Cathedral): Dorpat por volta de 1300
- [People from Pskov in Estonian towns](https://kirj.ee/wp-content/plugins/kirj/pub/arch-2-2026-101-131_20260811162049.pdf): colonos de Pskov em Dorpat e Tallinn
- [Gdańsk as a Hanseatic city](https://ejournals.eu/pliki_artykulu_czasopisma/pelny_tekst/018e9e3b-9b3b-73ed-8039-b29121daf6e0/pobierz): tomada de Danzig em 1308
- [Königsberg](https://en.wikipedia.org/wiki/K%C3%B6nigsberg): fundação e papel nas campanhas
- [Lithuanian Crusade](https://en.wikipedia.org/wiki/Lithuanian_Crusade): cruzadas contra a Lituânia e Grunwald
- [Christian of Oliva](https://en.wikipedia.org/wiki/Christian_of_Oliva), [Order of Dobrzyń](https://en.wikipedia.org/wiki/Order_of_Dobrzy%C5%84) e [Saint Meinhard](https://en.wikipedia.org/wiki/Saint_Meinhard): missões pacíficas e ordens absorvidas
- [Catholic Missionaries in the Evangelization of Livonia](https://eprints.whiterose.ac.uk/99928/3/Murray-SAGGIO.pdf): a missão pacífica de Meinhard
- [Scouts and Guides](https://www.ldkistorija.lt/?p=8871): batedores que serviam aos dois lados
- [Social learning spreads knowledge about dangerous humans among American crows](https://ngdc.cncb.ac.cn:443/openlb/publication/OLB-PM-21715408): estudo de Marzluff
- [Raven roosts are mobile information centres](https://www.originalwisdom.com/wp-content/uploads/bsk-pdf-manager/2019/04/MARZLUFF-et-al_1996_Raven-roosts-are-mobile-information-centres.pdf): dormitórios como centrais de informação
- [Butts for nuts](https://corvidresearch.blog/2022/02/05/butts-for-nuts-can-crows-do-our-dirty-work-and-should-they/): limites do treinamento de aves soltas
- [Spatial Overlap and Habitat Selection of Corvid Species in European Cities](https://doaj.org/article/d6989bd625db45fa9cdddc37ce91c7cb) e [Looduskalender](https://looduskalender.ee/n/en/node/96): corvídeos e paisagens
- [Great Famine hydroclimatic context](https://core.ac.uk/download/478145272.pdf): a Grande Fome no Báltico
