# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


beanie = Product.new(
  name: "beanie",
  price: 30,
  image_url: "https://newstaractive.com/cdn/shop/products/basic_beanie_reversible_49ers_chared_1.jpg?v=1507151403",
  description: "gray 49ers beanie"
)

beanie.save