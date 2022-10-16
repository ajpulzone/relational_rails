# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
@grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
@grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
@plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
@plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
@plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
@plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
