# Dicionário de Dados — Aluguel de Equipamentos Médicos

**Base de Dados:** `aluguel_equipamentos_medicos`  
**SGBD:** Microsoft SQL Server

---

## 1. `clientes`
Cadastro de hospitais, clínicas e pacientes.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do cliente |
| `nome` | `VARCHAR(150)` | Não | — | Nome completo ou razão social |
| `tipo` | `VARCHAR(2)` | Sim | `CHECK (tipo IN ('PF', 'PJ'))` | Tipo de cliente (Pessoa Física ou Jurídica) |
| `cpf_cnpj` | `VARCHAR(14)` | Não | `UNIQUE` | CPF ou CNPJ sem pontuação |
| `whatsapp` | `VARCHAR(20)` | Não | — | Número de contacto via WhatsApp |
| `endereco` | `VARCHAR(200)` | Sim | — | Endereço completo do cliente |
| `criado_em` | `DATETIME` | Não | `DEFAULT GETDATE()` | Data e hora de registo do cliente |

---

## 2. `categorias`
Classificação dos tipos de equipamentos disponíveis para locação.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único da categoria |
| `nome` | `VARCHAR(80)` | Não | `UNIQUE` | Nome da categoria do equipamento |
| `descricao` | `VARCHAR(200)` | Sim | — | Descrição resumida da categoria |

---

## 3. `funcionarios`
Equipa responsável pelas entregas, coletas, atendimento e manutenções.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do funcionário |
| `nome` | `VARCHAR(120)` | Não | — | Nome completo do funcionário |
| `cargo` | `VARCHAR(60)` | Sim | — | Função desempenhada na empresa |
| `telefone` | `VARCHAR(20)` | Sim | — | Telefone de contacto |

---

## 4. `equipamentos`
Registo individual de cada aparelho médico disponível no inventário.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do equipamento |
| `categoria_id` | `INT` | Não | `FK` → `categorias(id)` | Categoria à qual o equipamento pertence |
| `nome` | `VARCHAR(120)` | Não | — | Nome ou modelo do aparelho |
| `numero_serie` | `VARCHAR(60)` | Não | `UNIQUE` | Número de série para rastreabilidade |
| `lote` | `VARCHAR(40)` | Sim | — | Lote de fabrico/aquisição |
| `registro_anvisa` | `VARCHAR(40)` | Não | — | Número de registo na ANVISA |
| `valor_locacao` | `DECIMAL(10,2)` | Não | `CHECK (valor_locacao >= 0)` | Valor base de locação do equipamento |
| `status` | `VARCHAR(20)` | Não | `DEFAULT 'DISPONIVEL'`, `CHECK ('DISPONIVEL', 'LOCADO', 'MANUTENCAO', 'BAIXADO')` | Estado atual do equipamento |

---

## 5. `atendimentos_crm`
Histórico de contactos, orçamentos e suporte com os clientes.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do atendimento |
| `cliente_id` | `INT` | Não | `FK` → `clientes(id)` | Cliente associado ao contacto |
| `canal` | `VARCHAR(30)` | Sim | — | Canal de origem (WhatsApp, Telefone, Email, Site) |
| `assunto` | `VARCHAR(120)` | Sim | — | Tema principal do atendimento |
| `mensagem` | `VARCHAR(MAX)` | Sim | — | Registo detalhado da interação |
| `criado_em` | `DATETIME` | Não | `DEFAULT GETDATE()` | Data e hora do atendimento |

---

## 6. `contratos`
Contratos de locação de equipamentos firmados com os clientes.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do contrato |
| `cliente_id` | `INT` | Não | `FK` → `clientes(id)` | Cliente contratante |
| `equipamento_id` | `INT` | Não | `FK` → `equipamentos(id)` | Equipamento locado *(será migrado para `contrato_itens`)* |
| `tipo_cobranca` | `VARCHAR(20)` | Não | `DEFAULT 'MENSAL'`, `CHECK ('DIARIA', 'MENSAL', 'MEDICAO')` | Modalidade de faturação |
| `data_inicio` | `DATETIME` | Não | — | Data de início da vigência |
| `data_fim` | `DATETIME` | Sim | `CHECK (data_fim IS NULL OR data_fim >= data_inicio)` | Data de término prevista ou efetiva |
| `valor_total` | `DECIMAL(12,2)` | Não | `DEFAULT 0`, `CHECK (valor_total >= 0)` | Valor total do contrato |
| `status_contrato` | `VARCHAR(20)` | Não | `DEFAULT 'ATIVO'`, `CHECK ('ATIVO', 'ENCERRADO', 'CANCELADO')` | Estado atual do contrato |

---

## 7. `faturas`
Cobranças financeiras geradas a partir dos contratos de locação.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único da fatura |
| `contrato_id` | `INT` | Não | `FK` → `contratos(id)` | Contrato que originou a cobrança |
| `valor` | `DECIMAL(12,2)` | Não | `CHECK (valor > 0)` | Valor da cobrança |
| `data_vencimento` | `DATE` | Não | — | Data limite para pagamento |
| `forma_pagamento` | `VARCHAR(20)` | Sim | — | Meio de pagamento (Boleto, PIX, Cartão, Transferência) |
| `nota_fiscal` | `VARCHAR(30)` | Sim | — | Número da nota fiscal emitida |
| `status` | `VARCHAR(20)` | Não | `DEFAULT 'ABERTA'`, `CHECK ('ABERTA', 'PAGA', 'VENCIDA', 'CANCELADA')` | Estado do pagamento |

---

## 8. `manutencoes`
Histórico de intervenções preventivas e corretivas nos equipamentos.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único da manutenção |
| `equipamento_id` | `INT` | Não | `FK` → `equipamentos(id)` | Equipamento submetido à manutenção |
| `funcionario_id` | `INT` | Não | `FK` → `funcionarios(id)` | Técnico responsável pela execução |
| `tipo` | `VARCHAR(20)` | Sim | `CHECK (tipo IN ('PREVENTIVA', 'CORRETIVA'))` | Tipo de manutenção |
| `descricao` | `VARCHAR(MAX)` | Sim | — | Relato técnico do serviço realizado |
| `data_manutencao` | `DATETIME` | Não | `DEFAULT GETDATE()` | Data e hora da manutenção |
| `status` | `VARCHAR(20)` | Não | `DEFAULT 'ABERTA'` | Estado atual da ordem de manutenção |

---

## 9. `logistica`
Agendamento e controlo de entregas e coletas de equipamentos.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do agendamento |
| `contrato_id` | `INT` | Não | `FK` → `contratos(id)` | Contrato relacionado ao transporte |
| `funcionario_id` | `INT` | Não | `FK` → `funcionarios(id)` | Motorista/responsável pela rota |
| `tipo` | `VARCHAR(20)` | Sim | `CHECK (tipo IN ('ENTREGA', 'COLETA'))` | Tipo de operação logística |
| `data_agendada` | `DATETIME` | Não | — | Data e hora programadas |
| `rota` | `VARCHAR(100)` | Sim | — | Descrição da rota ou região de atendimento |
| `status` | `VARCHAR(20)` | Não | `DEFAULT 'AGENDADA'` | Estado da entrega/coleta |

---

## 10. `pecas_manutencao`
Registo das peças substituídas em cada manutenção.

| Coluna | Tipo | Nulo | Restrições / Default | Descrição |
| :--- | :--- | :---: | :--- | :--- |
| `id` | `INT` | Não | `PK`, `IDENTITY(1,1)` | Identificador único do registo de peça |
| `manutencao_id` | `INT` | Não | `FK` → `manutencoes(id)` | Manutenção na qual a peça foi utilizada |
| `nome_peca` | `VARCHAR(120)` | Não | — | Descrição da peça substituída |
| `quantidade` | `SMALLINT` | Não | `DEFAULT 1`, `CHECK (quantidade > 0)` | Quantidade de unidades utilizadas |
| `custo` | `DECIMAL(10,2)` | Não | `DEFAULT 0`, `CHECK (custo >= 0)` | Custo unitário ou total da peça |
