# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Experts

barbara_fu = Expert.create({ name: "Dr Barbara Fu" })
james_squirington = Expert.create({ name: "James Squirington, Esq" })
dane_the_dog = Expert.create({ name: "Dane the Dog" })
elle_ellenbacher = Expert.create({ name: "Elle Ellenbacher" })

# Projects

yellow_project = Project.create({ name: "Yellow Project" })
green_project = Project.create({ name: "Green Project" })
blue_project = Project.create({ name: "Blue Project" })

# Estimates

Estimate.create({expert: barbara_fu, project: yellow_project, min_magnitude: 1, likely_magnitude: 5, max_magnitude: 7, min_frequency: 1.0, likely_frequency: 1.1, max_frequency: 1.4}).run_callbacks(:save)
Estimate.create({expert: barbara_fu, project: green_project, min_magnitude: 1, likely_magnitude: 6, max_magnitude: 8, min_frequency: 1.4, likely_frequency: 2.1, max_frequency: 3.1}).run_callbacks(:save)
Estimate.create({expert: barbara_fu, project: blue_project, min_magnitude: 2, likely_magnitude: 3, max_magnitude: 9, min_frequency: 2.1, likely_frequency: 2.2, max_frequency: 2.8}).run_callbacks(:save)
Estimate.create({expert: james_squirington, project: yellow_project, min_magnitude: 5, likely_magnitude: 10, max_magnitude: 12, min_frequency: 2.0, likely_frequency: 2.9, max_frequency: 3.0}).run_callbacks(:save)
Estimate.create({expert: james_squirington, project: green_project, min_magnitude: 1, likely_magnitude: 6, max_magnitude: 8, min_frequency: 1.4, likely_frequency: 2.1, max_frequency: 3.1}).run_callbacks(:save)
Estimate.create({expert: dane_the_dog, project: yellow_project, min_magnitude: 1, likely_magnitude: 6, max_magnitude: 8, min_frequency: 1.4, likely_frequency: 2.1, max_frequency: 3.1}).run_callbacks(:save)
Estimate.create({expert: dane_the_dog, project: blue_project, min_magnitude: 2, likely_magnitude: 9, max_magnitude: 14, min_frequency: 2.2, likely_frequency: 3.4, max_frequency: 9.8}).run_callbacks(:save)
Estimate.create({expert: elle_ellenbacher, project: yellow_project, min_magnitude: 4, likely_magnitude: 6, max_magnitude: 7, min_frequency: 2.5, likely_frequency: 5.6, max_frequency: 11.5}).run_callbacks(:save)
