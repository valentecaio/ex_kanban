# ExKanban

## Introduction

ExKanban is a Kanban board example that runs on a backend built with Elixir/Phoenix and PostgreSQL, and a frontend built with React. Below are the instructions to install dependencies and launch both the backend and frontend.

## Directory Structure

- `elixir/`: Contains the Elixir backend code. Some interesting subdirectories are explained below:
```
elixir/
  ??? config/                # Environment setup files. Contains Postgres user/password setup.
  ??? lib/
  ?   ??? ex_kanban/         # Business and Database logic.
  ?   ??? ex_kanban_web/     # Web API logic.
  ?   ?   ??? graphql/
  ?   ?   ?   ??? router.ex  # GraphQL router logic.
  ?   ?   ?   ??? schema.ex  # GraphQL schema logic.
  ?   ?   ??? router.ex      # Web router entrypoint.
  ??? priv/
  ?   ??? repo/
  ?       ??? migrations/    # Scripts used to create database. Run with `mix ecto.setup`.
  ?       ??? seeds.exs      # Script used to populate database. Run with `mix ecto.setup`.
  ??? test/                  # Test scripts that run with `mix test`.
```


- `react/`: Contains the React frontend code. Some interesting subdirectories are explained below:
```
react/
  ??? package.json       # Node setup, including dependencies and scripts.
  ??? public/            # Public assets such as icons and images.
  ??? src/
      ??? App.jsx        # React entrypoint.
      ??? components/    # React components.
      ??? graphql/       # GraphQL logic and queries.
      ??? index.js       # Application entrypoint.
      ??? pages/         # Application pages.
      ??? styles/        # CSS files used to stylise components.  
      ??? test/          # Test scripts that run with `npm test`.
      ??? utils/         # JavaScript utilities reused by different React components.
```

## Prerequisites

- Elixir and Erlang installed
- Node.js and npm installed
- PostgreSQL installed

## Installation

1. Setup PostgreSQL  
  User and password must be defined in the file `elixir/config/dev.exs`.  
  The default value for both fields is `postgres`.

2. Install elixir dependencies and setup the database:
  ```sh
  cd elixir && mix deps.get && mix ecto.setup
  ```

3. Install react dependencies:
  ```sh
  cd react && npm install
  ```

## Running the Application

1. Start the Phoenix server:
  ```sh
  cd elixir && mix phx.server
  ```
  The backend should be running at `http://localhost:4000`

2. On a different console, start the React development server:
  ```sh
  cd react && npm start
  ```
  The frontend should be running at `http://localhost:3000`

## Running tests

1. Backend tests:
  ```sh
  cd elixir && mix test
  ```

2. Frontend tests:
  ```sh
  cd react && npm test
  ```

## Interative GraphQL testing

Start the backend server and visit `http://localhost:4000/api/graphiql` on a browser.

Query example:
```
{
  listTasks(search: "bike") {
    id
    name
    description
  }
}
```