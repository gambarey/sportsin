# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Sport.destroy_all
Club.destroy_all
User.destroy_all
Offer.destroy_all
Achievement.destroy_all
Application.destroy_all

5.times do
  Sport.create!(
    name: "volleyball"
  )
end

3.times do
  Club.create!(
    name: Faker::Sports::Volleyball.team,
    sport_id: Sport.last.id
  )
end

3.times do
  User.create!(
    name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    position: Faker::Sports::Volleyball.position,
    role: "athlete",
    description: Faker::Sports::Volleyball.formation,
    sport_id: Sport.last.id,
    email: Faker::Internet.email,
    password: 123456
  )
end

10.times do
  Offer.create!(
    title: Faker::Sports::Volleyball.position,
    location: Faker::Address.city,
    description: Faker::Job.position,
    fee: rand(2000..5000),
    club: Club.last
  )
end

5.times do
  Achievement.create!(
    name: Faker::Sports::Volleyball.position,
    description: Faker::Esport.league,
    user: User.last
  )
end

3.times do
  Application.create!(
    status: rand(0..2),
    user_id: User.last.id,
    offer_id: Offer.last.id
  )
end
