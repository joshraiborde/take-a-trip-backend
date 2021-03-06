# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(name: "Pam", username: "pam", password: "password")

orlando = Location.create(city: "Orlando", state: "Florida", country: "USA")
disneyworld = orlando.attractions.create(name: "Disney World", description: "Happiest Place on Earth!")
disneyworld = Attraction.first
pam = User.first
pam_disneyworld = pam.trips.create(start_date: ("2020-03-11"), end_date: ("2020-03-15"))

pam_disneyworld.visits.create(attraction: disneyworld, date: "2020-03-11")
pam.comments.create(content: "Dream come true", attraction: disneyworld)