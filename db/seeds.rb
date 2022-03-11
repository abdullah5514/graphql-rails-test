# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  author = Author.create(
      first_name: Faker::Name.first_name,
      sur_name: Faker::Name.last_name,
      birth_year: Faker::Date.between(from: '2000-01-01', to: '2021-01-01').year
  )

  Book.create(
      author: author,
      title: Faker::Movie.title,
      publish_year: Faker::Date.between(from: '2000-01-01', to: '2021-01-01').year,
      genre: Faker::Book.genre
  )
end