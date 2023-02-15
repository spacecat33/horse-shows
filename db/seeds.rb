# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Show.create!(title: "High Jumps", location: "London", discipline: "Show Jumping", level: 5, event_Fee: 50)
Show.create!(title: "Top Trot", location: "Paris", discipline: "Dressage", level: 4, event_Fee: 50)
Show.create!(title: "Fly like the wind", location: "Denver", discipline: "Cross Country", level: 5, event_Fee: 50)
Show.create!(title: "Cutie Pies", location: "Berlin", discipline: "Gymkhana", level: 1, event_Fee: 50)
Show.create!(title: "Yee Haa!", location: "Texas", discipline: "Rodeo", level: 3, event_Fee: 50)

