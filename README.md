# Aluguel de Equipamentos Médicos

Banco de dados SQL Server para uma locadora de equipamentos médicos, com uma aplicação web em Java (CRUD) que começa pela tabela `clientes`. Os clientes são **somente pessoas físicas** (identificadas por CPF).

## Estrutura

```text
.
├── app                     # aplicação web (Java / Spring Boot)
│   ├── pom.xml
│   └── src
├── sql
│   ├── ddl/01_criar_banco.sql        # criação do banco, tabelas e constraints
│   ├── dml/02_popular_tabelas.sql    # dados de exemplo
│   └── consultas/00_contagem_linhas.sql
└── README.md
```

## Tecnologias

- Java 17+
- Spring Boot 3.5 (Spring Web, Thymeleaf, Spring Data JPA, Bean Validation)
- Maven 3.9+
- SQL Server

## Banco de dados

Execute os scripts nesta ordem (SSMS, Azure Data Studio ou `sqlcmd`):

1. `sql/ddl/01_criar_banco.sql`
2. `sql/dml/02_popular_tabelas.sql`

Tabela `clientes`:

| Coluna      | Tipo         | Regras                                  |
|-------------|--------------|-----------------------------------------|
| `id`        | INT IDENTITY | PK                                      |
| `nome`      | VARCHAR(150) | obrigatório                             |
| `cpf`       | VARCHAR(11)  | obrigatório, único, 11 dígitos numéricos |
| `whatsapp`  | VARCHAR(20)  | obrigatório                             |
| `endereco`  | VARCHAR(200) | opcional                                |
| `criado_em` | DATETIME     | `DEFAULT GETDATE()`                     |

## Executando a aplicação

Defina as variáveis de ambiente (as credenciais não ficam no repositório):

| Variável      | Padrão                          |
|---------------|---------------------------------|
| `DB_USER`     | (obrigatória)                   |
| `DB_PASSWORD` | (obrigatória)                   |
| `DB_HOST`     | `localhost`                     |
| `DB_PORT`     | `1433`                          |
| `DB_NAME`     | `aluguel_equipamentos_medicos`  |
| `SERVER_PORT` | `8080`                          |

```powershell
$env:DB_USER = "sa"
$env:DB_PASSWORD = "sua_senha"
cd app
mvn spring-boot:run
```

Acesse `http://localhost:8080/clientes`. O SQL Server precisa aceitar conexões TCP/IP na porta configurada.

## CRUD de clientes

| Ação      | Rota                              |
|-----------|-----------------------------------|
| Listar / buscar por nome ou CPF | `GET /clientes?busca=...` |
| Novo      | `GET /clientes/novo` · `POST /clientes` |
| Editar    | `GET /clientes/{id}/editar` · `POST /clientes/{id}` |
| Excluir   | `POST /clientes/{id}/excluir`     |

Regras na aplicação: nome, CPF e WhatsApp obrigatórios; CPF com 11 dígitos e sem duplicidade; clientes com atendimentos ou contratos vinculados não podem ser excluídos (FK).
