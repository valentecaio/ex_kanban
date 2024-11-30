# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ExKanban.Repo.insert!(%ExKanban.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 1",
  description: "Task 1 description",
  address: "Task 1 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: :low
})

ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 2",
  description: "Task 2 description",
  address: "Task 2 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: :medium
})

ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 3",
  description: "Task 3 description",
  address: "Task 3 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: :high
})

# task with no attachments
ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 4",
  description: "Task 4 description",
  address: "Task 4 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: :high
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://live.staticflickr.com/38/86507752_c7c9a47e2f_c.jpg",
  task_id: 1
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://live.staticflickr.com/38/86507752_c7c9a47e2f_c.jpg",
  task_id: 1
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://live.staticflickr.com/38/86507752_c7c9a47e2f_c.jpg",
  task_id: 2
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://live.staticflickr.com/38/86507752_c7c9a47e2f_c.jpg",
  task_id: 3
})
