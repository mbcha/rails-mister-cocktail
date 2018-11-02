# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Dose.destroy_all
Ingredient.destroy_all

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
data = JSON.parse(open(url).read)

data["drinks"].each do |element|
  Ingredient.create(name: element["strIngredient1"])
end

Review.create(title: "lovely", stars: 3, cocktail_id: 4)
