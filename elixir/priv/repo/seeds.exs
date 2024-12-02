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
  name: "Fix bike tire",
  description: "Replace inner tube and patch the tire.",
  location: "Garage",
  execution_date: ~U[2024-12-05 00:00:00Z],
  priority: :low,
  status: :backlog
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://www.wikihow.com/Fix-a-Bike-Tire",
  task_id: 1
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://hips.hearstapps.com/hmg-prod/images/fixing-flat-0085-preview-1630429202.jpg",
  task_id: 1
})


ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Buy water pump",
  description: "Get specifications of necessary water pump, search for prices and buy it.",
  location: "Laundry",
  execution_date: ~U[2024-12-01 00:00:00Z],
  priority: :medium,
  status: :done
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHFv6p8haLIlmotQY9_Hm0v7Wtauw2Y5FbJw&s",
  task_id: 2
})


ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Install water pump",
  description: "After receiving the water pump, install it in the laundry.",
  location: "Laundry",
  execution_date: ~U[2024-12-02 00:00:00Z],
  priority: :high,
  status: :in_progress
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://dtoswater.com/step-by-step-water-pump-installation-guide/",
  task_id: 3
})


ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Fix the roof",
  description: "There is a leak in the roof, fix it.",
  location: "Garage",
  execution_date: ~U[2024-12-03 00:00:00Z],
  priority: :high,
  status: :done
})

ExKanban.Repo.insert!(%ExKanban.Attachments.Attachment{
  url: "https://i.ytimg.com/vi/Gg21UyM2YMw/maxresdefault.jpg",
  task_id: 4
})


# task with no attachments
ExKanban.Repo.insert!(%ExKanban.Tasks.Task{
  name: "Fix the bike brakes",
  description: "The front brake is not working properly, fix it.",
  location: "Garage",
  execution_date: ~U[2024-12-05 00:00:00Z],
  priority: :medium,
  status: :backlog
})
