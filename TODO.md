## Elixir

* Pagination
* Tests
* Docker
* Document API

## React

* Tests
* Docker

## Some commands used on project creation
```
  # elixir
  mix phx.new ex_kanban --no-assets --no-html --no-dashboard --no-mailer
  mix mix phx.gen.context Tasks Task tasks name:string execution_date:utc_datetime location:string priority:integer description:string status:integer
  mix phx.gen.context Attachments Attachment attachments task_id:references:tasks url:string
  mix ecto.setup

  # react
  npx create-react-app ex-kanban
```