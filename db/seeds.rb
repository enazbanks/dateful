# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Couple.destroy_all
Booking.destroy_all
User.destroy_all
SpecialDay.destroy_all
Experience.destroy_all
Rating.destroy_all

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
  instructions: "Bring your best boy doggo, head to the nearest park with your partner and don't forget the frisbee"
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours"
)
file = URI.open("https://images.fosterwebmarketing.com/994/two-dogs-playing-tug-of-war-with-disc.jpg")
experience.photos.attach(io: file, filename: "zoomies.jpg", content_type: "image/jpg")
experience.save!

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
  instructions: "Get in early before George snags all the cold ones, suggest you organise a taxi for the ride home"
)
file = URI.open("https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/da/55/64.jpg")
experience.photos.attach(io: file, filename: "balter.jpg", content_type: "image/jpg")
experience.save!

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
  instructions: "Forget bitcon, ruby gems are the new hotness, Bring a calculator and your love of graphs"
)
file = URI.open("https://www.bonobology.com/wp-content/uploads/2018/01/signs-you%E2%80%99ve-married-a-foodie.jpg")
experience.photos.attach(io: file, filename: "stock.jpg", content_type: "image/jpg")
experience.save!

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
  instructions: "Follow Jan, or if you can't keep up Ryan is happy to take you on a more relaxed ride"
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "45 minutes"
)
file = URI.open("https://ilovebicycling.com/wp-content/uploads/2018/02/p5pb11906851.jpg")
experience.photos.attach(io: file, filename: "ride.jpg", content_type: "image/jpg")
experience.save!

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
  instructions: "Bring a picnic blanket and meet at 6pm near the Observatory"
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "10 minutes"
)
file = URI.open("https://i.pinimg.com/originals/89/14/10/8914108a20fd73fc44dd2d0b13da4f80.jpg")
experience.photos.attach(io: file, filename: "star.jpg", content_type: "image/jpg")
experience.save!

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
  instructions: "Don't eat beforehand"
  cost: 0,
  time: "1-2 hours"
)
file = URI.open("https://static.wixstatic.com/media/78d068_222e7514186a4c7db62ed9e655da89e3~mv2.jpg/v1/fill/w_560,h_374,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/78d068_222e7514186a4c7db62ed9e655da89e3~mv2.jpg")
experience.photos.attach(io: file, filename: "meal.jpg", content_type: "image/jpg")
experience.save!

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
