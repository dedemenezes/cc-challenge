# 👶 IBGE Names CLI

A Ruby command-line interface (CLI) for exploring name rankings and statistics in Brazil, using data from the [IBGE API](https://servicodados.ibge.gov.br/api/docs/nomes).

## 📦 Features

- ✅ View the most common names in each Brazilian state (UF)
- ✅ View name rankings filtered by gender
- 🔜 View the most common names by city
- 🔜 Track name usage frequency over time

## 🏃 Getting Started

### Requirements

- Ruby `>= 3.1`
- Bundler

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/dedemenezes/cc-challenge.git
   cd cc-challenge
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Run the app:

   ```bash
   ruby app.rb
   ```

## 📖 Usage

After launching the CLI, you'll see the following menu:

```
1. Ranking dos nomes mais comuns em uma determinada Unidade Federativa (UF)
2. Ranking dos nomes mais comuns em uma determinada cidade
3. Frequência do uso de um nome ao longo dos anos
Type 'q' or 'quit' to exit
```

Use the number keys to choose an option. Follow the prompts to explore the dataset.

## 🧪 Running Tests

This project uses `minitest` and `webmock`.

```bash
ruby test/state_test.rb
ruby test/ibge_test.rb
```

You can also run all tests using `rake`:

```bash
bundle exec rake test
```

## 🗂️ Project Structure

```bash
.
├── app.rb                    # Entry point
├── router.rb                 # CLI router/dispatcher
├── commands/                # Command implementations
│   └── top_common_names.rb
├── services/                # API wrappers
│   └── ibge_service.rb
├── models/
│   └── state.rb             # Represents a Brazilian state (UF)
├── views/
│   └── output_renderer.rb   # Handles all CLI output formatting
├── test/
│   ├── state_test.rb
│   └── ibge_test.rb
└── README.md
```

## 📚 IBGE API Reference

- [Estados (UF)](https://servicodados.ibge.gov.br/api/v1/localidades/estados)
- [Ranking de nomes por UF e sexo](https://servicodados.ibge.gov.br/api/v2/censos/nomes/ranking)

## 🚀 Roadmap

- [ ] Command for name ranking in cities
  - Ranking dos nomes mais comuns em uma determinada cidade

    - Obter o nome de uma cidade no terminal

    - Exibir o resultado em 3 tabelas:
      - Uma para o ranking geral
      - Outras duas tabelas separando os resultados para cada sexo
- [ ] Command for name trends over time
  - Frequência do uso de um nome ao longo dos anos

    - Solicitar um ou mais nomes (separados sempre por vírgula)

    - Exibir uma tabela única, onde cada linha representa uma década e cada coluna representa um dos nomes informados na etapa anterior

- [ ] Improve test coverage
- [ ] Add caching for performance


## 📜 License

MIT © [André Menezes](https://github.com/dedemenezes)


Além da qualidade e organização do seu código, vamos avaliar também a facilidade de uso das interfaces e a qualidade da exibição dos resultados de cada consulta. Então dedique algum tempo para formatar minimamente as tabelas solicitadas.

A sua aplicação pode ser executada de duas formas:

1. Como uma aplicação que fica em execução de forma constante e conta com um menu para o usuário escolher a consulta a ser realizada ou sair da aplicação.

2. Como um CLI, similar a comandos como `git` e `rails` que você executa em seu terminal. Nesse formato você deve ter uma opção `--help` que traz todas as opções possíveis para execução (todas as consultas e como o usuário deve passar os parâmetros necessários em cada consulta)
