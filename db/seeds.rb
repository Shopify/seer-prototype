# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Experts

puts "Loading seed data. This will take some time, please be patient."

barbara_fu = Expert.create({ name: "Dr Barbara Fu" })
james_squirington = Expert.create({ name: "James Squirington, Esq" })
dane_the_dog = Expert.create({ name: "Dane the Dog" })
elle_ellenbacher = Expert.create({ name: "Elle Ellenbacher" })

# Projects

yellow_project = Project.create({ name: "Yellow Project" })
green_project = Project.create({ name: "Green Project" })
blue_project = Project.create({ name: "Blue Project" })
orange_project = Project.create({ name: "Orange Project" })

# Familiarities

never_seen = Familiarity.create(description: "Never seen this project before")
heard_of = Familiarity.create(description: "Heard of this project but never used")
used_few = Familiarity.create(description: "Used a few times")
frequently = Familiarity.create(description: "Used frequently")
creator_maintainer = Familiarity.create(description: "Creator or maintainer of the project")

# Metrics

Metric.create({
  name: "Hotdogs Possessed",
  value: 27,
  kind: :product,
  project: yellow_project
})

Metric.create({
  name: "Bun Bakers",
  value: 3,
  kind: :product,
  project: yellow_project
})

Metric.create({
  name: "Hotdogs Possessed",
  value: 11,
  kind: :product,
  project: green_project
})

Metric.create({
  name: "Bun Bakers",
  value: 1,
  kind: :product,
  project: green_project
})

Metric.create({
  name: "Hotdogs Possessed",
  value: 18,
  kind: :product,
  project: blue_project
})

Metric.create({
  name: "Bun Bakers",
  value: 2,
  kind: :product,
  project: blue_project
})

Metric.create({
  name: "Hotdogs Possessed",
  value: 6,
  kind: :product,
  project: orange_project
})

Metric.create({
  name: "Bun Bakers",
  value: 1,
  kind: :product,
  project: orange_project
})

# Estimates

Estimate.create({
  expert: barbara_fu,
  project: yellow_project,
  min_magnitude: 1,
  likely_magnitude: 5,
  max_magnitude: 7,
  min_frequency: 1.0,
  likely_frequency: 1.1,
  max_frequency: 1.4,
  familiarity_id: creator_maintainer.id,
  number_of_samples: 100_000,
  justification: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
}).run_callbacks(:save)

Estimate.create({
  expert: barbara_fu,
  project: green_project,
  min_magnitude: 1,
  likely_magnitude: 6,
  max_magnitude: 8,
  min_frequency: 1.4,
  likely_frequency: 2.1,
  max_frequency: 3.1,
  familiarity_id: frequently.id,
  number_of_samples: 100_000,
  justification: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
}).run_callbacks(:save)

Estimate.create({
  expert: barbara_fu,
  project: blue_project,
  min_magnitude: 2,
  likely_magnitude: 3,
  max_magnitude: 9,
  min_frequency: 2.1,
  likely_frequency: 2.2,
  max_frequency: 2.8,
  familiarity_id: used_few.id,
  number_of_samples: 100_000,
  justification: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
}).run_callbacks(:save)

Estimate.create({
  expert: barbara_fu,
  project: orange_project,
  min_magnitude: 4,
  likely_magnitude: 4,
  max_magnitude: 8,
  min_frequency: 1.1,
  likely_frequency: 4.4,
  max_frequency: 9.9,
  familiarity_id: heard_of.id,
  number_of_samples: 100_000,
  justification: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
}).run_callbacks(:save)

Estimate.create({
  expert: james_squirington,
  project: green_project,
  min_magnitude: 4,
  likely_magnitude: 8,
  max_magnitude: 11,
  min_frequency: 1.1,
  likely_frequency: 1.9,
  max_frequency: 2.2,
  familiarity_id: never_seen.id,
  number_of_samples: 100_000,
  justification: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
}).run_callbacks(:save)

Estimate.create({
  expert: james_squirington,
  project: yellow_project,
  min_magnitude: 5,
  likely_magnitude: 10,
  max_magnitude: 12,
  min_frequency: 2.0,
  likely_frequency: 2.9,
  max_frequency: 3.0,
  familiarity_id: creator_maintainer.id,
  number_of_samples: 100_000,
  justification: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
}).run_callbacks(:save)

Estimate.create({
  expert: dane_the_dog,
  project: yellow_project,
  min_magnitude: 1,
  likely_magnitude: 6,
  max_magnitude: 8,
  min_frequency: 1.4,
  likely_frequency: 2.1,
  max_frequency: 3.1,
  familiarity_id: frequently.id,
  number_of_samples: 100_000,
  justification: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
}).run_callbacks(:save)

Estimate.create({
  expert: dane_the_dog,
  project: blue_project,
  min_magnitude: 2,
  likely_magnitude: 9,
  max_magnitude: 14,
  min_frequency: 2.2,
  likely_frequency: 3.4,
  max_frequency: 9.8,
  familiarity_id: used_few.id,
  number_of_samples: 100_000,
  justification: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
}).run_callbacks(:save)

Estimate.create({
  expert: elle_ellenbacher,
  project: yellow_project,
  min_magnitude: 4,
  likely_magnitude: 6,
  max_magnitude: 7,
  min_frequency: 2.5,
  likely_frequency: 5.6,
  max_frequency: 11.5,
  familiarity_id: heard_of.id,
  number_of_samples: 100_000,
  justification: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
}).run_callbacks(:save)
