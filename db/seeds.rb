# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: 'admin', last_name: 'user', email: 'support@domain.com', password: 'support1234', role: 0)

id = 1
2.times do
  Task.create(name: "task #{id}", description: "Example task #{id}")
  id = id + 1
end