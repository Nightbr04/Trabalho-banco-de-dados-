-- =====================================================================
-- BLOCO 0: Criação do banco de dados
-- =====================================================================
IF DB_ID('aluguel_equipamentos_medicos') IS NULL
    CREATE DATABASE aluguel_equipamentos_medicos;
GO
USE aluguel_equipamentos_medicos;
GO

-- =====================================================================
-- BLOCO 1: Tabela CLIENTES (cadastro de hospitais, clínicas e pacientes)
-- Constraints: PK, CHECK no tipo, UNIQUE no CPF/CNPJ, DEFAULT na data
-- =====================================================================
CREATE TABLE clientes (
    id          INT IDENTITY(1,1)  NOT NULL,
    nome        VARCHAR(150)       NOT NULL,
    tipo        VARCHAR(2)         NULL,
    cpf_cnpj    VARCHAR(14)        NOT NULL,
    whatsapp    VARCHAR(20)        NOT NULL,
    endereco    VARCHAR(200)       NULL,
    criado_em   DATETIME           NOT NULL CONSTRAINT df_clientes_criado_em DEFAULT GETDATE(),
    CONSTRAINT pk_clientes            PRIMARY KEY (id),
    CONSTRAINT uq_clientes_cpf_cnpj   UNIQUE (cpf_cnpj),
    CONSTRAINT ck_clientes_tipo       CHECK (tipo IN ('PF', 'PJ'))
);
GO

-- =====================================================================
-- BLOCO 2: Tabela CATEGORIAS (ex.: ventilador, monitor, laser estético)
-- =====================================================================
CREATE TABLE categorias (
    id          INT IDENTITY(1,1)  NOT NULL,
    nome        VARCHAR(80)        NOT NULL,
    descricao   VARCHAR(200)       NULL,
    CONSTRAINT pk_categorias     PRIMARY KEY (id),
    CONSTRAINT uq_categorias_nome UNIQUE (nome)
);
GO

-- =====================================================================
-- BLOCO 3: Tabela FUNCIONARIOS (equipe que faz entregas e manutenções)
-- =====================================================================
CREATE TABLE funcionarios (
    id          INT IDENTITY(1,1)  NOT NULL,
    nome        VARCHAR(120)       NOT NULL,
    cargo       VARCHAR(60)        NULL,
    telefone    VARCHAR(20)        NULL,
    CONSTRAINT pk_funcionarios PRIMARY KEY (id)
);
GO

-- =====================================================================
-- BLOCO 4: Tabela EQUIPAMENTOS (cada aparelho que pode ser alugado)
-- Constraints: PK, FK para categorias, CHECK no valor e no status,
-- DEFAULT no status, UNIQUE no número de série (rastreabilidade)
-- =====================================================================
CREATE TABLE equipamentos (
    id              INT IDENTITY(1,1)  NOT NULL,
    categoria_id    INT                NOT NULL,
    nome            VARCHAR(120)       NOT NULL,
    numero_serie    VARCHAR(60)        NOT NULL,
    lote            VARCHAR(40)        NULL,
    registro_anvisa VARCHAR(40)        NOT NULL,
    valor_locacao   DECIMAL(10,2)      NOT NULL,
    status          VARCHAR(20)        NOT NULL CONSTRAINT df_equipamentos_status DEFAULT 'DISPONIVEL',
    CONSTRAINT pk_equipamentos             PRIMARY KEY (id),
    CONSTRAINT uq_equipamentos_numero_serie UNIQUE (numero_serie),
    CONSTRAINT ck_equipamentos_valor       CHECK (valor_locacao >= 0),
    CONSTRAINT ck_equipamentos_status      CHECK (status IN ('DISPONIVEL', 'LOCADO', 'MANUTENCAO', 'BAIXADO')),
    CONSTRAINT fk_equipamentos_categoria   FOREIGN KEY (categoria_id) REFERENCES categorias (id)
);
GO

-- =====================================================================
-- BLOCO 5: Tabela ATENDIMENTOS_CRM (histórico de contatos com o cliente)
-- =====================================================================
CREATE TABLE atendimentos_crm (
    id          INT IDENTITY(1,1)  NOT NULL,
    cliente_id  INT                NOT NULL,
    canal       VARCHAR(30)        NULL,
    assunto     VARCHAR(120)       NULL,
    mensagem    VARCHAR(MAX)       NULL,
    criado_em   DATETIME           NOT NULL CONSTRAINT df_atendimentos_criado_em DEFAULT GETDATE(),
    CONSTRAINT pk_atendimentos_crm         PRIMARY KEY (id),
    CONSTRAINT fk_atendimentos_cliente     FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);
GO

-- =====================================================================
-- BLOCO 6: Tabela CONTRATOS (locação de um equipamento para um cliente)
-- Constraints: PK, 2 FKs, CHECK no período, no valor e no status,
-- DEFAULT em tipo de cobrança, valor e status
-- =====================================================================
CREATE TABLE contratos (
    id                INT IDENTITY(1,1)  NOT NULL,
    cliente_id        INT                NOT NULL,
    equipamento_id    INT                NOT NULL,
    tipo_cobranca     VARCHAR(20)        NOT NULL CONSTRAINT df_contratos_tipo_cobranca DEFAULT 'MENSAL',
    data_inicio       DATETIME           NOT NULL,
    data_fim          DATETIME           NULL,
    valor_total       DECIMAL(12,2)      NOT NULL CONSTRAINT df_contratos_valor DEFAULT 0,
    status_contrato   VARCHAR(20)        NOT NULL CONSTRAINT df_contratos_status DEFAULT 'ATIVO',
    CONSTRAINT pk_contratos              PRIMARY KEY (id),
    CONSTRAINT fk_contratos_cliente      FOREIGN KEY (cliente_id)     REFERENCES clientes (id),
    CONSTRAINT fk_contratos_equipamento  FOREIGN KEY (equipamento_id) REFERENCES equipamentos (id),
    CONSTRAINT ck_contratos_cobranca     CHECK (tipo_cobranca IN ('DIARIA', 'MENSAL', 'MEDICAO')),
    CONSTRAINT ck_contratos_valor        CHECK (valor_total >= 0),
    CONSTRAINT ck_contratos_status       CHECK (status_contrato IN ('ATIVO', 'ENCERRADO', 'CANCELADO')),
    CONSTRAINT ck_contratos_periodo      CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);
GO

-- =====================================================================
-- BLOCO 7: Tabela FATURAS (cobranças geradas a partir de um contrato)
-- Constraints: PK, FK, CHECK no valor e no status, DEFAULT no status
-- =====================================================================
CREATE TABLE faturas (
    id                INT IDENTITY(1,1)  NOT NULL,
    contrato_id       INT                NOT NULL,
    valor             DECIMAL(12,2)      NOT NULL,
    data_vencimento   DATE               NOT NULL,
    forma_pagamento   VARCHAR(20)        NULL,
    nota_fiscal       VARCHAR(30)        NULL,
    status            VARCHAR(20)        NOT NULL CONSTRAINT df_faturas_status DEFAULT 'ABERTA',
    CONSTRAINT pk_faturas              PRIMARY KEY (id),
    CONSTRAINT fk_faturas_contrato     FOREIGN KEY (contrato_id) REFERENCES contratos (id),
    CONSTRAINT ck_faturas_valor        CHECK (valor > 0),
    CONSTRAINT ck_faturas_status       CHECK (status IN ('ABERTA', 'PAGA', 'VENCIDA', 'CANCELADA'))
);
GO

-- =====================================================================
-- BLOCO 8: Tabela MANUTENCOES (histórico de manutenções dos aparelhos)
-- Constraints: PK, 2 FKs, CHECK no tipo, DEFAULT na data e no status
-- =====================================================================
CREATE TABLE manutencoes (
    id                INT IDENTITY(1,1)  NOT NULL,
    equipamento_id    INT                NOT NULL,
    funcionario_id    INT                NOT NULL,
    tipo              VARCHAR(20)        NULL,
    descricao         VARCHAR(MAX)       NULL,
    data_manutencao   DATETIME           NOT NULL CONSTRAINT df_manutencoes_data DEFAULT GETDATE(),
    status            VARCHAR(20)        NOT NULL CONSTRAINT df_manutencoes_status DEFAULT 'ABERTA',
    CONSTRAINT pk_manutencoes              PRIMARY KEY (id),
    CONSTRAINT fk_manutencoes_equipamento  FOREIGN KEY (equipamento_id) REFERENCES equipamentos (id),
    CONSTRAINT fk_manutencoes_funcionario  FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id),
    CONSTRAINT ck_manutencoes_tipo         CHECK (tipo IN ('PREVENTIVA', 'CORRETIVA'))
);
GO

-- =====================================================================
-- BLOCO 9: Tabela LOGISTICA (entregas e coletas agendadas)
-- Constraints: PK, 2 FKs, CHECK no tipo, DEFAULT no status
-- =====================================================================
CREATE TABLE logistica (
    id              INT IDENTITY(1,1)  NOT NULL,
    contrato_id     INT                NOT NULL,
    funcionario_id  INT                NOT NULL,
    tipo            VARCHAR(20)        NULL,
    data_agendada   DATETIME           NOT NULL,
    rota            VARCHAR(100)       NULL,
    status          VARCHAR(20)        NOT NULL CONSTRAINT df_logistica_status DEFAULT 'AGENDADA',
    CONSTRAINT pk_logistica               PRIMARY KEY (id),
    CONSTRAINT fk_logistica_contrato      FOREIGN KEY (contrato_id)    REFERENCES contratos (id),
    CONSTRAINT fk_logistica_funcionario   FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id),
    CONSTRAINT ck_logistica_tipo          CHECK (tipo IN ('ENTREGA', 'COLETA'))
);
GO

-- =====================================================================
-- BLOCO 10: Tabela PECAS_MANUTENCAO (peças trocadas em cada manutenção)
-- Constraints: PK, FK, CHECK na quantidade e no custo, DEFAULT na quantidade
-- =====================================================================
CREATE TABLE pecas_manutencao (
    id              INT IDENTITY(1,1)  NOT NULL,
    manutencao_id   INT                NOT NULL,
    nome_peca       VARCHAR(120)       NOT NULL,
    quantidade      SMALLINT           NOT NULL CONSTRAINT df_pecas_quantidade DEFAULT 1,
    custo           DECIMAL(10,2)      NOT NULL CONSTRAINT df_pecas_custo DEFAULT 0,
    CONSTRAINT pk_pecas_manutencao         PRIMARY KEY (id),
    CONSTRAINT fk_pecas_manutencao         FOREIGN KEY (manutencao_id) REFERENCES manutencoes (id),
    CONSTRAINT ck_pecas_quantidade         CHECK (quantidade > 0),
    CONSTRAINT ck_pecas_custo              CHECK (custo >= 0)
);
GO