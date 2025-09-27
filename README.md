# 🚀 Ambiente de Desenvolvimento - Tech Challenge FIAP

Este projeto automatiza a configuração do ambiente para os microsserviços:

- `ms-agendamento`
- `ms-historico`
- `ms-notificacao`
- `ms-login`
- `ms-usuario`

## 📦 O que será configurado?

- Clonagem automática dos repositórios
- Geração de um `docker-compose.yml` com dois bancos de dados
- Preparação do ambiente para rodar os serviços localmente com Docker

---

## ✅ Pré-requisitos

Antes de executar os scripts, instale os seguintes softwares:

| Requisito   | Descrição                                                                 |
|-------------|---------------------------------------------------------------------------|
| [Docker](https://www.docker.com/)       | Necessário para rodar os containers dos bancos de dados.           |
| [Java JRE 21+](https://www.oracle.com/java/technologies/javase/jdk21-archive-downloads.html) | Recomendado pelo menos JRE 21 para execução dos projetos.          |
| [Postman](https://www.postman.com/downloads/)     | Para testar as collections de API.                                 |
| [DBeaver](https://dbeaver.io/download/) | Opcional, para visualizar os bancos de dados de forma gráfica.     |
| Git         | Para clonar os repositórios automaticamente.               |

---

## 💻 Como usar

### 🐧 Linux ou macOS

1. Abra o terminal
2. Dê permissão de execução ao script:
   ```bash
   chmod +x setup.sh
   ```
3. Execute o script:
   ```bash
   ./setup.sh
   ```

---

### 🪟 Windows

1. Dê duplo clique no arquivo `setup.bat`  
   Ou abra o terminal no diretório e execute:
   ```cmd
   setup.bat
   ```

---

## 🛠️ O que o script faz?

- Clona os repositórios:
    - `https://github.com/TC-FIAP-HOSPITAL/ms-agendamento`
    - `https://github.com/TC-FIAP-HOSPITAL/ms-historico`
    - `https://github.com/TC-FIAP-HOSPITAL/ms-login`
    - `https://github.com/TC-FIAP-HOSPITAL/ms-usuario`
    - `https://github.com/TC-FIAP-HOSPITAL/ms-notificacao`
- Cria um arquivo `docker-compose.yml` com dois bancos (MySQL e PostgreSQL)
- Cria volumes dedicados para persistência de dados
- Inicia os containers com `docker compose up -d`

---

## 🔍 Observações

- Os containers de banco sobem automaticamente, mas os microsserviços precisam ser iniciados via IDE ou terminal (caso queira rodá-los manualmente).
- Você pode usar o Postman para testar endpoints com as collections fornecidas nos projetos.

---

## 📁 Estrutura esperada após execução

```
/seu-diretorio/
│
├── data/
├── ms-login/
├── ms-usuario/
├── ms-agendamento/
├── ms-historico/
├── ms-notificacao/
├── docker-compose.yml
├── setup.sh
└── setup.bat
```
