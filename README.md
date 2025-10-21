# Simple Sol - Lista de Smart Contracts Progressivos

## 📚 Padrão de Níveis de Dificuldade

**Nível 1:** Conceitos básicos (variáveis de estado, funções simples)
**Nível 2:** Manipulação de dados (arrays, mappings, validações básicas)
**Nível 3:** Lógica intermediária (controle de acesso, eventos, modifiers)
**Nível 4:** Sistemas intermediários (múltiplas entidades, timelock, permissões)
**Nível 5:** Padrões avançados (tokens ERC, interfaces, herança)
**Nível 6:** Sistemas complexos (marketplaces, leilões, interações entre contratos)

---

## 🎯 Lista de Smart Contracts (16 Contratos)

### **Nível 1 - Flipper**
**Conceito:** Estado booleano básico

**Level 1 - Estado Básico**
```
DADO que o contrato foi deployado
QUANDO eu chamo a função flip()
ENTÃO o estado booleano deve ser invertido
E DEVE emitir um evento StateChanged
```

**Level 2 - Controle de Propriedade**
```
DADO que apenas o owner pode alterar o estado
QUANDO um endereço não-owner tenta chamar flip()
ENTÃO a transação DEVE reverter com "Only owner"
E QUANDO o owner chama flip()
ENTÃO o estado DEVE ser alterado normalmente
```

**Level 3 - Histórico de Mudanças**
```
DADO que queremos rastrear mudanças
QUANDO flip() é chamado
ENTÃO DEVE salvar timestamp da mudança
E DEVE incrementar contador de mudanças
E DEVE permitir consultar histórico por índice
```

**Level 4 - Múltiplos Estados**
```
DADO que temos múltiplos flippers nomeados
QUANDO chamo flip("flipper1")
ENTÃO apenas o flipper1 DEVE ser alterado
E outros flippers DEVEM permanecer inalterados
```

### **Nível 1 - Ping-Pong**
**Conceito:** Funções de retorno simples

**Level 1 - Resposta Básica**
```
DADO que o contrato recebe uma string
QUANDO chamo ping("Ping")
ENTÃO DEVE retornar "Pong"
E QUANDO chamo ping("Hello")
ENTÃO DEVE retornar "Unknown command"
```

**Level 2 - Contador de Chamadas**
```
DADO que queremos contar interações
QUANDO ping() é chamado
ENTÃO DEVE incrementar contador global
E DEVE retornar número da chamada junto com resposta
```

**Level 3 - Múltiplas Respostas**
```
DADO comandos: "Ping"→"Pong", "Hello"→"Hi", "Bye"→"Goodbye"
QUANDO chamo ping(comando)
ENTÃO DEVE retornar resposta correspondente
E DEVE manter contador por tipo de comando
```

**Level 4 - Sistema de Pontuação**
```
DADO que cada jogador tem pontuação
QUANDO jogador acerta comando
ENTÃO DEVE ganhar 1 ponto
E QUANDO erra DEVE perder 1 ponto
E DEVE permitir consultar ranking
```

### **Nível 1 - Calculator**
**Conceito:** Operações matemáticas básicas

**Level 1 - Operações Básicas**
```
DADO dois números a e b
QUANDO chamo add(a, b)
ENTÃO DEVE retornar a + b
E DEVE funcionar para subtract, multiply, divide
```

**Level 2 - Histórico de Operações**
```
DADO que queremos rastrear cálculos
QUANDO uma operação é executada
ENTÃO DEVE salvar no histórico com timestamp
E DEVE permitir consultar últimas N operações
```

**Level 3 - Operações Avançadas**
```
DADO operações como power, sqrt, factorial
QUANDO chamo power(2, 3)
ENTÃO DEVE retornar 8
E DEVE validar inputs (ex: sqrt de negativo)
```

**Level 4 - Múltiplas Calculadoras**
```
DADO calculadoras nomeadas por usuário
QUANDO usuário A faz cálculo
ENTÃO DEVE salvar no histórico apenas do usuário A
E outros usuários NÃO DEVEM ver este histórico
```

### **Nível 1 - Simple Wallet**
**Conceito:** Carteira básica de ETH

**Level 1 - Depósito e Saque**
```
DADO que posso depositar ETH
QUANDO envio ETH para o contrato
ENTÃO meu saldo DEVE ser atualizado
E QUANDO chamo withdraw(amount)
ENTÃO DEVE transferir ETH de volta
```

**Level 2 - Controle de Propriedade**
```
DADO que apenas o owner pode sacar
QUANDO não-owner tenta sacar
ENTÃO DEVE reverter com "Not owner"
E qualquer um DEVE poder depositar
```

**Level 3 - Múltiplos Usuários**
```
DADO que múltiplos usuários podem ter saldo
QUANDO usuário A deposita 1 ETH
ENTÃO apenas saldo de A DEVE aumentar
E usuário A só DEVE poder sacar seu próprio saldo
```

**Level 4 - Limites e Taxas**
```
DADO limites de saque diário
QUANDO usuário tenta sacar mais que limite
ENTÃO DEVE reverter com "Daily limit exceeded"
E DEVE cobrar taxa de 1% em saques
```

### **Nível 2 - Counter**
**Conceito:** Manipulação de números

**Level 1 - Contador Básico**
```
DADO um contador iniciando em 0
QUANDO chamo increment()
ENTÃO contador DEVE ser 1
E QUANDO chamo decrement()
ENTÃO contador DEVE voltar a 0
```

**Level 2 - Limites de Segurança**
```
DADO limites mínimo=0 e máximo=100
QUANDO contador está em 100 e chamo increment()
ENTÃO DEVE reverter com "Max limit reached"
E QUANDO está em 0 e chamo decrement()
ENTÃO DEVE reverter com "Min limit reached"
```

**Level 3 - Controle de Acesso**
```
DADO que apenas owner pode resetar
QUANDO owner chama reset()
ENTÃO contador DEVE voltar a 0
E QUANDO não-owner tenta reset()
ENTÃO DEVE reverter com "Only owner"
```

**Level 4 - Múltiplos Contadores**
```
DADO contadores nomeados
QUANDO chamo increment("counter1")
ENTÃO apenas counter1 DEVE ser incrementado
E DEVE permitir diferentes limites por contador
```

### **Nível 2 - Simple Storage**
**Conceito:** Armazenamento de dados

**Level 1 - String Storage**
```
DADO que posso armazenar uma string
QUANDO chamo store("Hello World")
ENTÃO DEVE salvar a string
E QUANDO chamo retrieve()
ENTÃO DEVE retornar "Hello World"
```

**Level 2 - Key-Value Storage**
```
DADO armazenamento chave-valor
QUANDO chamo store("name", "Alice")
ENTÃO DEVE salvar com chave "name"
E QUANDO chamo get("name")
ENTÃO DEVE retornar "Alice"
```

**Level 3 - Permissões de Escrita**
```
DADO que apenas endereços autorizados podem escrever
QUANDO endereço autorizado chama store()
ENTÃO DEVE salvar normalmente
E QUANDO não-autorizado tenta store()
ENTÃO DEVE reverter com "Not authorized"
```

**Level 4 - Versionamento**
```
DADO que queremos histórico de versões
QUANDO atualizo valor existente
ENTÃO DEVE manter versão anterior
E DEVE permitir consultar versão específica
```

### **Nível 2 - Event Logger**
**Conceito:** Sistema de eventos e logs

**Level 1 - Log Básico**
```
DADO que posso registrar eventos
QUANDO chamo logEvent("User login")
ENTÃO DEVE emitir evento EventLogged
E DEVE salvar com timestamp atual
```

**Level 2 - Categorias de Log**
```
DADO categorias: INFO, WARNING, ERROR
QUANDO chamo logEvent("message", "ERROR")
ENTÃO DEVE salvar com categoria ERROR
E DEVE permitir filtrar por categoria
```

**Level 3 - Logs por Usuário**
```
DADO que cada usuário tem seus logs
QUANDO usuário A registra evento
ENTÃO DEVE aparecer apenas nos logs de A
E outros usuários NÃO DEVEM ver
```

**Level 4 - Retenção de Logs**
```
DADO limite de 100 logs por usuário
QUANDO usuário excede limite
ENTÃO DEVE remover logs mais antigos
E DEVE manter sempre os 100 mais recentes
```

### **Nível 3 - Voting**
**Conceito:** Sistema de votação

**Level 1 - Votação Básica**
```
DADO candidatos ["Alice", "Bob"] e votantes registrados
QUANDO votante registrado vota em "Alice"
ENTÃO voto DEVE ser contabilizado
E votante NÃO DEVE poder votar novamente
```

**Level 2 - Período de Votação**
```
DADO período de votação definido
QUANDO tentativa de voto antes do início
ENTÃO DEVE reverter com "Voting not started"
E QUANDO tentativa após fim
ENTÃO DEVE reverter com "Voting ended"
```

**Level 3 - Pesos de Voto**
```
DADO que votantes têm pesos diferentes
QUANDO votante com peso 3 vota
ENTÃO DEVE contar como 3 votos
E resultado DEVE refletir votos ponderados
```

**Level 4 - Múltiplas Propostas**
```
DADO múltiplas propostas simultâneas
QUANDO votante vota na proposta 1
ENTÃO DEVE poder votar em outras propostas
E cada proposta DEVE ter resultado independente
```

### **Nível 3 - Locker**
**Conceito:** Timelock de fundos

**Level 1 - Lock Básico**
```
DADO que posso travar ETH por período
QUANDO deposito 1 ETH por 1 dia
ENTÃO fundos DEVEM ficar travados
E DEVE poder sacar apenas após 1 dia
```

**Level 2 - Múltiplos Locks**
```
DADO que posso ter vários locks
QUANDO crio lock com ID "lock1"
ENTÃO DEVE permitir criar "lock2" independente
E cada lock DEVE ter seu próprio prazo
```

**Level 3 - Extensão de Prazo**
```
DADO lock existente
QUANDO chamo extendLock(lockId, newTime)
ENTÃO prazo DEVE ser estendido
E NÃO DEVE permitir reduzir prazo
```

**Level 4 - Penalidade por Saque Antecipado**
```
DADO penalidade de 10% para saque antecipado
QUANDO saco antes do prazo
ENTÃO DEVE cobrar 10% de taxa
E 90% DEVE ser transferido para usuário
```

### **Nível 3 - BoxMail**
**Conceito:** Sistema de mensagens

**Level 1 - Mensagens Públicas**
```
DADO que qualquer um pode enviar mensagem
QUANDO chamo sendMessage("Hello")
ENTÃO mensagem DEVE ser salva com timestamp
E DEVE ser visível para todos
```

**Level 2 - Organização por Remetente**
```
DADO mensagens de diferentes remetentes
QUANDO consulto getMessagesBySender(address)
ENTÃO DEVE retornar apenas mensagens daquele remetente
E DEVE manter ordem cronológica
```

**Level 3 - Mensagens Privadas**
```
DADO sistema de mensagens privadas
QUANDO envio mensagem privada para endereço X
ENTÃO apenas X DEVE poder ler a mensagem
E outros endereços NÃO DEVEM ter acesso
```

**Level 4 - Confirmação de Leitura**
```
DADO que remetente quer saber se foi lida
QUANDO destinatário lê mensagem
ENTÃO DEVE marcar como lida
E remetente DEVE poder consultar status
```

### **Nível 4 - Whitelist Manager**
**Conceito:** Controle de acesso

**Level 1 - Lista Básica**
```
DADO que admin pode gerenciar whitelist
QUANDO admin adiciona endereço
ENTÃO endereço DEVE estar na whitelist
E QUANDO remove, NÃO DEVE mais estar
```

**Level 2 - Níveis de Permissão**
```
DADO níveis: VIEWER(1), USER(2), ADMIN(3)
QUANDO adiciono usuário com nível USER
ENTÃO DEVE ter permissões de USER e VIEWER
E NÃO DEVE ter permissões de ADMIN
```

**Level 3 - Sistema de Convites**
```
DADO que admin pode criar convites
QUANDO cria convite com expiração
ENTÃO usuário DEVE poder aceitar antes da expiração
E APÓS expiração convite DEVE ser inválido
```

**Level 4 - Hierarquia de Permissões**
```
DADO hierarquia de grupos
QUANDO usuário está no grupo "Managers"
ENTÃO DEVE herdar permissões do grupo "Users"
E DEVE ter permissões adicionais de "Managers"
```

### **Nível 4 - Multi-Signature Wallet**
**Conceito:** Carteira com múltiplas assinaturas

**Level 1 - Assinaturas Básicas**
```
DADO carteira 2-de-3 (requer 2 de 3 assinaturas)
QUANDO 2 signatários aprovam transação
ENTÃO transação DEVE ser executada
E com apenas 1 aprovação NÃO DEVE executar
```

**Level 2 - Tipos de Transação**
```
DADO diferentes tipos: TRANSFER, ADD_SIGNER, REMOVE_SIGNER
QUANDO proposta é do tipo ADD_SIGNER
ENTÃO DEVE requerer 3 de 3 assinaturas
E TRANSFER DEVE requerer apenas 2 de 3
```

**Level 3 - Expiração de Propostas**
```
DADO proposta com prazo de 7 dias
QUANDO prazo expira sem assinaturas suficientes
ENTÃO proposta DEVE ser automaticamente rejeitada
E NÃO DEVE mais aceitar assinaturas
```

**Level 4 - Revogação de Assinaturas**
```
DADO que signatário já aprovou
QUANDO chama revokeSignature()
ENTÃO sua aprovação DEVE ser removida
E contagem de assinaturas DEVE diminuir
```

### **Nível 4 - Escrow Service**
**Conceito:** Serviço de custódia

**Level 1 - Escrow Básico**
```
DADO comprador, vendedor e árbitro
QUANDO comprador deposita fundos
ENTÃO fundos DEVEM ficar em custódia
E apenas árbitro DEVE poder liberar
```

**Level 2 - Múltiplos Escrows**
```
DADO múltiplas transações simultâneas
QUANDO crio escrow com ID único
ENTÃO DEVE permitir gerenciar independentemente
E cada escrow DEVE ter suas próprias partes
```

**Level 3 - Disputa e Resolução**
```
DADO que comprador pode disputar
QUANDO abre disputa
ENTÃO árbitro DEVE poder decidir
E DEVE poder dividir fundos entre as partes
```

**Level 4 - Taxa de Serviço**
```
DADO taxa de 2% para o serviço
QUANDO escrow é finalizado
ENTÃO 2% DEVE ir para o contrato
E 98% DEVE ir para beneficiário
```

### **Nível 5 - ERC20 Token**
**Conceito:** Token fungível padrão

**Level 1 - Implementação Básica**
```
DADO implementação completa do ERC20
QUANDO chamo transfer(to, amount)
ENTÃO DEVE transferir tokens corretamente
E DEVE emitir evento Transfer
```

**Level 2 - Mint e Burn Controlados**
```
DADO que apenas owner pode mint
QUANDO owner chama mint(to, amount)
ENTÃO DEVE criar novos tokens
E totalSupply DEVE aumentar
```

**Level 3 - Pausable e Blacklist**
```
DADO que contrato pode ser pausado
QUANDO está pausado
ENTÃO transfers DEVEM reverter
E endereços na blacklist NÃO DEVEM poder transferir
```

**Level 4 - Sistema de Taxas**
```
DADO taxa de 1% em transfers
QUANDO faço transfer de 100 tokens
ENTÃO destinatário DEVE receber 99 tokens
E 1 token DEVE ir para pool de taxas
```

### **Nível 5 - ERC721 NFT**
**Conceito:** Token não-fungível

**Level 1 - Implementação Básica**
```
DADO implementação completa do ERC721
QUANDO mint NFT para usuário
ENTÃO usuário DEVE ser owner do token
E DEVE poder transferir para outros
```

**Level 2 - Metadata Dinâmico**
```
DADO que NFTs têm metadata
QUANDO chamo tokenURI(tokenId)
ENTÃO DEVE retornar URI válido
E metadata DEVE ser atualizável pelo owner
```

**Level 3 - Sistema de Royalties**
```
DADO royalty de 5% para criador
QUANDO NFT é vendido no marketplace
ENTÃO 5% DEVE ir para criador original
E 95% DEVE ir para vendedor atual
```

**Level 4 - Breeding/Fusion**
```
DADO dois NFTs "pais"
QUANDO chamo breed(tokenId1, tokenId2)
ENTÃO DEVE criar novo NFT "filho"
E DEVE combinar atributos dos pais
```

### **Nível 6 - Auction House**
**Conceito:** Sistema de leilões

**Level 1 - Leilão Inglês Básico**
```
DADO NFT em leilão por 24 horas
QUANDO faço lance maior que atual
ENTÃO DEVE se tornar lance vencedor
E DEVE estender prazo se próximo do fim
```

**Level 2 - Múltiplos Tipos**
```
DADO leilão holandês (preço decrescente)
QUANDO preço atinge valor aceitável
ENTÃO comprador DEVE poder finalizar
E DEVE transferir NFT imediatamente
```

**Level 3 - Reserva e Buy-Now**
```
DADO leilão com preço de reserva
QUANDO lances não atingem reserva
ENTÃO leilão DEVE ser cancelado
E com buy-now DEVE vender imediatamente
```

**Level 4 - Leilões em Lote**
```
DADO múltiplos NFTs no mesmo leilão
QUANDO lance vence
ENTÃO DEVE transferir todos NFTs do lote
E DEVE dividir pagamento proporcionalmente
```

---

## 🚀 Como Usar Esta Lista

1. **Comece pelo Nível 1** - Mesmo que você tenha experiência, os fundamentos são importantes
2. **Complete todos os levels** - Cada level adiciona complexidade importante  
3. **Siga o formato BDD** - Use as especificações DADO/QUANDO/ENTÃO como guia
4. **Teste extensivamente** - Cada contrato deve ser testado antes de avançar
5. **Documente seu código** - Pratique boas práticas de documentação

## 📝 Estrutura de Cada Exercício

Cada contrato deve incluir:
- ✅ **Código do contrato** (.sol)
- ✅ **Testes unitários** seguindo as especificações BDD
- ✅ **Script de deploy**
- ✅ **Documentação** das funções
- ✅ **Análise de gas** (níveis 4+)

## 🎯 Formato BDD Explicado

As especificações seguem o padrão **Behavior Driven Development (BDD)**:

- **DADO** (Given): Condições iniciais/contexto
- **QUANDO** (When): Ação que será executada  
- **ENTÃO** (Then): Resultado esperado
- **E** (And): Condições adicionais

**Exemplo prático:**
```solidity
// DADO que o contrato foi deployado
// QUANDO eu chamo a função flip()
// ENTÃO o estado booleano deve ser invertido

function testFlipChangesState() public {
    // DADO - estado inicial
    bool initialState = flipper.getState();
    
    // QUANDO - ação
    flipper.flip();
    
    // ENTÃO - verificação
    assertEq(flipper.getState(), !initialState);
}
```

---

*Esta lista foi criada para proporcionar uma jornada de aprendizado progressiva em desenvolvimento de smart contracts Solidity, com especificações claras e acionáveis para cada exercício.*