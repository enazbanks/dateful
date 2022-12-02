# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

MOOD = %w[Romantic Adventrous Relaxed Playful Spicy Foodie Instagrammable Pamper Active Retro]
couple = Couple.new
couple.save

frank = User.create!(
  first_name: 'Frank',
  last_name: 'liaison',
  email: 'frank@lewagon.com',
  password: 'franktest'
)

frank.couple = couple
file = URI.open("https://cdn.pixabay.com/photo/2016/12/13/16/17/dancer-1904467__340.png")
frank.avatar.attach(io: file, filename: "frank.png", content_type: "image/png")
frank.save!

bertha = User.create(
  first_name: 'Bertha',
  last_name: 'liaison',
  email: 'bertha@lewagon.com',
  password: 'berthatest',
  couple: couple
)
file = URI.open("https://cdn.pixabay.com/photo/2019/03/21/20/29/eyewear-4071870__340.jpg")
bertha.avatar.attach(io: file, filename: "bertha.png", content_type: "image/png")
bertha.save!

couple = Couple.new
couple.save

experience = Experience.new(
  title: 'zoomies playdate',
  description: 'Playtime for Dogs',
  address: "park near you",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours"
)

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save

booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save
rand(10..50).times do
  y = rand(0..5)
  x = rand(0..5)
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Balters Tour',
  description: 'So many Balters',
  address: "Balter HQ",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours"
)

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save
rand(10..50).times do
  y = rand(0..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Stock Check',
  description: 'Stonks!',
  address: "Office near you",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "30 minutes"
)
rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save!
rand(10..50).times do
  y = rand(1..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Gruappo Ride',
  description: 'My Legs hurt',
  address: "The Open road",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "45 minutes"
)
rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save
rand(10..50).times do
  y = rand(2..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Star Gazing',
  description: 'Astrolog to the rescue',
  address: "Look up stupid",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "10 minutes"
)
rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end

experience.save
booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save
rand(10..50).times do
  y = rand(3..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Mealful',
  description: "The Best Meal you've ever had",
  address: "At the Table",
  cost: 0,
  time: "1-2 hours"
)

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save

booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false,
  status: 3
)
booking.couple = couple
booking.experience = experience
booking.save
rand(10..50).times do
  rating = Rating.new(
    stars: 5,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end
puts "seed done"

SpecialDay.create(
  couple: Couple.first,
  title: "anniversary",
  date: Date.today

)
