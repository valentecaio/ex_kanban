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
  priority: 1
})

ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 2",
  description: "Task 2 description",
  address: "Task 2 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: 2
})

ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 3",
  description: "Task 3 description",
  address: "Task 3 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: 3
})

# task with no attachments
ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Task 4",
  description: "Task 4 description",
  address: "Task 4 address",
  execution_date: ~U[2022-01-01 00:00:00Z],
  priority: 4
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://plus.unsplash.com/premium_photo-1694819488591-a43907d1c5cc",
  task_id: 1
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://plus.unsplash.com/premium_photo-1694819488591-a43907d1c5cc",
  task_id: 1
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://plus.unsplash.com/premium_photo-1694819488591-a43907d1c5cc",
  task_id: 2
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://plus.unsplash.com/premium_photo-1694819488591-a43907d1c5cc",
  task_id: 3
})
