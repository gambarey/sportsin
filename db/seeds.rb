# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

Achievement.destroy_all
Application.destroy_all
Message.destroy_all
Offer.destroy_all
ClubHistory.destroy_all
Club.destroy_all
User.destroy_all
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


# User:

user1 = User.create(name: 'Manuel', last_name: 'Sánchez', position: 'Striker', description: 'Defined by Globo:
  "A killer like van Nistelrooy. Give me the ball and I do wonders"', sport_id: sport1.id, email: 'manuel@sportsin.com', password: 123456)
puts "user1 created!"

user2 = User.create(
  name: 'Maria',
  last_name: 'Smith',
  position: 'Manager',
  description: 'Owner of Barcelona',
  sport_id: sport2.id,
  email: 'maria@sportsin.com',
  password: 123456
)
puts "user2 created!"

user4 = User.create(
  name: 'Joao',
  last_name: 'Smith',
  position: 'Oposite',
  description: 'Owner of Lisboa',
  sport_id: sport2.id,
  email: 'joao@sportsin.com',
  password: 123456
)
puts "user4 created!"

user3 = User.create(
  name: 'Felipe',
  last_name: 'Hernandez',
  position: 'Setter',
  description: 'Winner of the World Cup 2023',
  sport_id: sport2.id,
  email: 'felipe@sportsin.com',
  password: 123456
)
profile1 = URI.open("https://res.cloudinary.com/daaaaanx5/image/upload/v1670247074/development/FelipeSquare_mejord.png")
user3.photo.attach(io: profile1, filename: "IMG_0861_sweidl.jpg", content_type: "image/jpg")
puts "user3 created!"

# Clubs
# club1 = Club.create(name: 'Lugo M.B', sport_id: sport5.id)
# puts "club1 created!"
# club2 = Club.create(name: 'Madrid S.C', sport_id: sport3.id)
# puts "club2 created!"
# club3 = Club.create(name: 'Barcelona C.D', sport_id: sport1.id)
# puts "club3 created!"

club_photo4 = URI.open("https://res.cloudinary.com/daaaaanx5/image/upload/v1669900052/development/Sevilla_umux94.png")
club4 = Club.new(name: 'Sevilla C.D', sport_id: sport2.id, owner: user3)
club4.photo.attach(io: club_photo4, filename: "umux94.png")
club4.save
puts "club4 created!"

club_photo6 = URI.open("https://res.cloudinary.com/daaaaanx5/image/upload/v1670337401/development/DALL_E_2022-12-06_15.08.40_ke5mrb.png")
club6 = Club.new(name: 'Paris V. C.', sport_id: sport2.id, owner: user1)
club6.photo.attach(io: club_photo6, filename: "ke5mrb.png.png")
club6.save
puts "club6 created!"

club_photo7 = URI.open("https://res.cloudinary.com/daaaaanx5/image/upload/v1670337401/development/DALL_E_2022-12-06_15.07.00_-_logo_volleyball_clubs_uzweml.png")
club7 = Club.new(name: 'Lisbon Volley', sport_id: sport2.id, owner: user4)
club7.photo.attach(io: club_photo7, filename: "uzweml.png")
club7.save
puts "club7 created!"

club_photo2 = URI.open("https://res.cloudinary.com/daaaaanx5/image/upload/v1669899891/development/Cuenca_as6rzx.png")
club5 = Club.create(name: 'Cuenca C.D', sport_id: sport2.id, owner: user2)
club5.photo.attach(io: club_photo2, filename: "Cuenca.png", content_type: "image/png")
club5.save
puts "club5 created!"

#offer:
offer1 = Offer.create(
  title: 'Needed libero in Sevilla C.D',
  location: 'Sevilla',
  description: 'Lets win the Liga. We need a Libero for our volleyball team.
  Join our volleyball club and take your game to the next level! Our experienced coaches and trainers are here to help you become the best player you can be.',
  fee: 30000,
  club_id: club4.id
)
  puts "offer1 created!"

offer6 = Offer.create(
  title: 'Needed Setter in Paris V. C.',
  location: 'Paris',
  description: 'We need a Setter for our volleyball team. Urgent! Join our team as a Professional Volleyball Player and help us reach our goals of becoming a top-tier team!',
  fee: 35000,
  club_id: club6.id
)
puts "offer6 created!"

offer7 = Offer.create(
  title: 'Needed Outside Hitter in Paris V. C.',
  location: 'Paris',
  description: 'We need a Outside Hitter for our volleyball team. Urgent!  Exciting opportunity for an experienced Volleyball Player to join a fast-growing and successful professional volleyball organization!',
  fee: 45000,
  club_id: club5.id
)
puts "offer7 created!"

offer2 = Offer.create(
  title: 'Needed setter player for Sevilla C.D',
  location: 'Sevilla',
  description: 'Our team needs a setter position player for our team in Seville. Join our Professional Volleyball Club as a High-Level Athlete, competing at the highest level of the sport.',
  fee: 25000,
  club_id: club4.id
)
puts "offer2 created!"

offer8 = Offer.create(
  title: 'Needed setter player for Lisbon Volley',
  location: 'Lisbon',
  description: 'Our team needs a setter position player for our team in Lisbon. Work under the supervision of our expert coaching staff to hone your skills and reach your maximum potential.',
  fee: 20000,
  club_id: club7.id
)
puts "offer8 created!"

offer9 = Offer.create(
  title: 'Needed Oposite player for Lisbon Volley',
  location: 'Lisbon',
  description: 'Our team needs a oposite position player for our team in Lisbon. Represent the club in a positive manner, both on and off the court',
  fee: 22000,
  club_id: club7.id
)
puts "offer9 created!"

offer3 = Offer.create(
  title: 'Cuenca C.D needs a setter',
  location: 'Cuenca',
  description: 'Urgent Setter needed',
  fee: 20000,
  club_id: club5.id
)
puts "offer3 created!"

offer4 = Offer.create(
  title: 'Looking for a Middle Blocker at Sevilla C.D',
  location: 'Sevilla',
  description: 'Our team needs a Middle Blocker position player for our team in Seville. Work with the team to create positive team dynamics and develop camaraderie.',
  fee: 15000,
  club_id: club4.id
)
puts "offer4 created!"

offer5 = Offer.create(
  title: 'Looking for a Setter at Berlin B.R.',
  location: 'Berlin',
  description: 'Our team needs a Setter position player for our team in Berlin. Maintain high standards of sportsmanship and fair play while competing.',
  fee: 30000,
  club_id: club5.id
)
puts "offer5 created!"

# achievements TITLES:

achievement1 = Achievement.create(
  name: 'Winner State Tournament in France 2021',
  sort: 'title',
  user_id: user3.id
)
puts "title created!"

achievement2 = Achievement.create(
  name: 'Winner of the Volleyball cup in Brazil',
  user_id: user3.id,
  sort: "title"
)
puts "title2 created!"

achievement3 = Achievement.create(
  name: 'Best defender in 2022',
  user_id: user3.id,
  sort: "title"
)
puts "title3 created!"
achievement4 = Achievement.create(
  name: 'Best libero in 2021',
  user_id: user3.id,
  sort: "title"
)
puts "title4 created!"

achievement5 = Achievement.create(
  name: 'Winner State Tournament in France 2020',
  user_id: user3.id,
  sort: "title"
)
puts "title5 created!"

achievement6 = Achievement.create(
  name: 'Winner of the Volleyball cup in Peru',
  user_id: user3.id,
  sort: "title"
)
puts "title6 created!"

#Achievements ACHIEVEMENTS:

achievement7 = Achievement.create(
  name: 'Nominated to Best Blocker in 2022',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement1 created!"
achievement8 = Achievement.create(
  name: 'Nominated to Best Setter in 2021',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement2 created!"

achievement9 = Achievement.create(
  name: 'Nominated to Best Defender in 2022',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement3 created!"

achievement10 = Achievement.create(
  name: 'Nominated to Best Setter in 2021',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement4 created!"

achievemen11 = Achievement.create(
  name: 'Winner State Tournament in France 2020',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement5 created!"

achievement12 = Achievement.create(
  name: 'MVP from Spain League',
  user_id: user3.id,
  sort: "honor"
)
puts "achievement6 created!"

# application

application1 = Application.create(
  status: 0,
  user_id: user3.id,
  offer_id: offer5.id
)
puts "application1 created!"

application2 = Application.create(
  status: 0,
  user_id: user3.id,
  offer_id: offer8.id
)
puts "application2 created!"
application3 = Application.create(
  status: 0,
  user_id: user2.id,
  offer_id: offer4.id
)
puts "application3 created!"

application4 = Application.create(
  status: 0,
  user_id: user1.id,
  offer_id: offer3.id
)
puts "application4 created!"

application5 = Application.create(
  status: 0,
  user_id: user4.id,
  offer_id: offer7.id
)
puts "application5 created!"

club_history = ClubHistory.create(
  club_id: club4.id,
  user_id: user3.id,
  start_date: "2021-12-07",
  end_date: "2023-12-07",
  jersey_number: 1
)

puts "club_history1 created!"

club_history2 = ClubHistory.create(
  club_id: club5.id,
  user_id: user3.id,
  start_date: "2019-12-07",
  end_date: "2020-12-07",
  jersey_number: 1
)
puts "club_history2 created!"

club_history2 = ClubHistory.create(
  club_id: club6.id,
  user_id: user3.id,
  start_date: "2018-12-07",
  end_date: "2029-12-07",
  jersey_number: 1
)

puts "club_history3 created!"
