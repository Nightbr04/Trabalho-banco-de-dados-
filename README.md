# Gerenciamento de Pedidos 

Sistema para gerenciamento de pedidos com frontend e backend separados.

## Tecnologias utilizadas

### Backend
- Java 21
- Spring Boot 3.5
- Spring Web
- Spring Data JPA
- Hibernate
- Bean Validation
- Maven

### Frontend
- React 18
- TypeScript
- Vite
- React Router
- Axios
- CSS

### Banco de dados
- PostgreSQL
- Scripts SQL versionados em `database/scripts`

## Estrutura do projeto

```text
.
├── backend
│   ├── pom.xml
│   ├── .env.example
│   └── src
├── frontend
│   ├── package.json
│   ├── .env.example
│   └── src
├── database
│   └── scripts
│       ├── 001_schema.sql
│       └── 002_seed.sql
└── README.md
```

## Funcionalidades da primeira etapa

- Estrutura completa de projeto frontend/backend.
- API REST base com CRUD de pedidos.
- Endpoints de clientes e produtos para cadastro e listagem.
- Validação de dados com Bean Validation.
- Tratamento centralizado de excecoes.
- DTOs para nao expor entidades JPA diretamente.
- CORS configurado para frontend local.
- Script de schema PostgreSQL com constraints e relacionamentos.
- Tela administrativa inicial de gerenciamento de pedidos.
- Integracao frontend-backend preparada com Axios e variaveis de ambiente.
- Estrutura inicial de testes (JUnit 5/Mockito/Spring Boot Test e Vitest no frontend).

## Modelagem do banco (PostgreSQL)

Entidades:
- clientes
- produtos
- pedidos
- itens_pedido

Relacionamentos:
- 1 cliente para N pedidos
- 1 pedido para N itens_pedido
- 1 produto para N itens_pedido

Regras garantidas por schema e aplicacao:
- Sem quantidade negativa
- Sem preco invalido
- Pedido deve conter ao menos um item
- Valor total calculado com base nos itens

## Pre-requisitos

- Java 21+
- Maven 3.9+
- Node.js 20+
- npm 10+
- PostgreSQL 14+

## Configuracao do PostgreSQL

1. Crie um banco chamado `gerenciamento_pedidos`.
2. Execute os scripts:

```sql
-- no psql ou ferramenta equivalente
\i database/scripts/001_schema.sql
\i database/scripts/002_seed.sql
```

## Variaveis de ambiente

### Backend (`backend/.env.example`)
- DB_HOST
- DB_PORT
- DB_NAME
- DB_USER
- DB_PASSWORD
- SERVER_PORT
- FRONTEND_URL

### Frontend (`frontend/.env.example`)
- VITE_API_BASE_URL

## Como executar o backend

```bash
cd backend
mvn spring-boot:run
```

API base: `http://localhost:8080/api`

## Como executar o frontend

```bash
cd frontend
npm install
npm run dev
```

App web: `http://localhost:5173`

## Comandos de validacao

Backend:

```bash
cd backend
mvn test
```

Frontend:

```bash
cd frontend
npm run build
```

## Endpoints principais

Pedidos:
- GET /api/pedidos
- GET /api/pedidos/{id}
- POST /api/pedidos
- PUT /api/pedidos/{id}
- DELETE /api/pedidos/{id}

Clientes:
- GET /api/clientes
- POST /api/clientes

Produtos:
- GET /api/produtos
- POST /api/produtos

## Observacoes

- O frontend nao acessa o banco diretamente.
- Toda comunicacao ocorre via API REST do backend.
- Credenciais nao devem ser versionadas em arquivos reais de ambiente.
