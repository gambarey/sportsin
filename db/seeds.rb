# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Achievement.destroy_all
Application.destroy_all
User.destroy_all
Offer.destroy_all
Club.destroy_all
Sport.destroy_all

# Sports:
sport1 = Sport.create(name: 'Football')
puts "sport1 created!"
sport2 = Sport.create(name: 'Voleyball')
puts "sport2 created!"
sport3 = Sport.create(name: 'Waterpolo')
puts "sport3 created!"
sport4 = Sport.create(name: 'Padel')
puts "sport4 created!"
sport5 = Sport.create(name: 'Tennis')
puts "sport5 created!"

# 5.times do
#   Sport.create!(
#     name: Faker::Sports.sport
#   )
# end

# Clubs
club1 = Club.create(name: 'Lugo M.B', sport_id: sport5.id)
puts "club1 created!"
club2 = Club.create(name: 'Madrid S.C', sport_id: sport3.id)
puts "club2 created!"
club3 = Club.create(name: 'Barcelona C.D', sport_id: sport1.id)
puts "club3 created!"
club4 = Club.create(name: 'Sevilla C.D', sport_id: sport2.id)
puts "club4 created!"
club5 = Club.create(name: 'Cuenca C.D', sport_id: sport4.id)
puts "club5 created!"
# 5.times do
#   Club.create!(
#     name: Faker::Sports::Volleyball.team,
#     sport_id: Sport.last.id
#   )
# end

# User:

user1 = User.create(name: 'Manuel', last_name: 'Sánchez', position: 'Striker', description: 'Defined by Globo:
  "A killer like van Nistelrooy. Give me the ball and I do wonders"', sport_id: sport1.id, email: 'manuel@sportsin.com', password: 123456)
puts "user1 created!"

user2 = User.create(
  name: 'Maria',
  last_name: 'Smith',
  position: 'Singles',
  description: 'Winner of the last regional slam in France',
  sport_id: sport5.id,
  email: 'maria@sportsin.com',
  password: 123456)
puts "user2 created!"

user3 = User.create(
  name: 'Felipe',
  last_name: 'Hermoso',
  position: 'Libero',
  description: 'Winner of the World Cup 2023',
  sport_id: sport2.id,
  email: 'felipe@sportsin.com',
  password: 123456)
puts "user3 created!"

# 3.times do
#   User.create!(
#     name: Faker::Name.name,
#     last_name: Faker::Name.last_name,
#     position: Faker::Sports::Volleyball.position,
#     description: Faker::Sports::Volleyball.formation,
#     sport_id: Sport.last.id,
#     email: Faker::Internet.email,
#     password: 123456
#   )
# end


# 10.times do
#   Offer.create!(
#     title: Faker::Sports::Volleyball.position,
#     location: Faker::Address.city,
#     description: Faker::Job.position,
#     fee: rand(2000..5000),
#     club: Club.last
#   )
# end

# 5.times do
#   Achievement.create!(
#     name: Faker::Sports::Volleyball.position,
#     description: Faker::Esport.league,
#     user: User.last
#   )
# end

# 3.times do
#   Application.create!(
#     status: rand(0..2),
#     user_id: User.last.id,
#     offer_id: Offer.last.id
#   )
# end
