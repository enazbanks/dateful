# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

SpecialDay.destroy_all
User.destroy_all
Rating.destroy_all
Experience.destroy_all
Booking.destroy_all
Couple.destroy_all


MOOD = %w[Romantic Adventurous Relaxed Playful Spicy Foodie Instagrammable Pamper Active Retro]

15.times do
  couple = Couple.new
  couple.save
  user = User.new(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
  file = URI.open("https://i.pravatar.cc/40")
  user.avatar.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
  user.couple = couple
  user.save(:validate => false)
  puts user.name
  user = User.new(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
  file = URI.open("https://i.pravatar.cc/40")
  user.avatar.attach(io: file, filename: "avatar.jpg", content_type: "image/jpg")
  user.couple = couple
  user.save(:validate => false)
  puts user.name
end

# Experiences

experience = Experience.new(
  title: 'zoomies playdate',
  description: 'Playtime for Dogs',
  address: "104 Coppin Street, Richmond, Victoria",
  instructions: "Bring your best boy doggo, head to the nearest park with your partner and don't forget the frisbee",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours"
)
file = URI.open("https://images.unsplash.com/photo-1601758176175-45914394491c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "zoomies.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1601758261049-55d060e1159a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "zoomies1.jpg", content_type: "image/jpg")

file = URI.open("https://images.fosterwebmarketing.com/994/two-dogs-playing-tug-of-war-with-disc.jpg")
experience.photos.attach(io: file, filename: "zoomies2.jpg", content_type: "image/jpg")

experience.mood_list.add("Playful")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Active")
experience.save!

rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )

  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save!

  y = rand(0..5)
  x = rand(0..5)
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save!
end

experience = Experience.new(
  title: 'Balters Beer Tour',
  description: 'So many Balters. Explore the flavors of the Balters on this guided beer and food day tour Starting from Melbourne, your culinary adventure includes visits to several hand-picked wineries, a seasonal 2-course lunch at a beautiful cellar door, and a trip to a local chocolaterie & ice creamery. You’ll end the day with a trip to a craft brewery, before settling in for the scenic drive back to the city.',
  address: "14 Traders Way, Currumbin Waters, Queensland",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours",
  instructions: "Get in early before George snags all the cold ones, suggest you organise a taxi for the ride home"
)
file = URI.open("https://images.unsplash.com/photo-1543791959-12b3f543282a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80.jpg")
experience.photos.attach(io: file, filename: "balter.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1532617094436-572dfd36237b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80.jpg")
experience.photos.attach(io: file, filename: "balter1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1500138911630-61524ea40324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "balter2.jpg", content_type: "image/jpg")

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save!
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save

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
  time: "30 minutes",
  instructions: "Forget Bitcon, Ruby gems are the new hotness. Bring a calculator and your love of graphs"
)
file = URI.open("https://www.bonobology.com/wp-content/uploads/2018/01/signs-you%E2%80%99ve-married-a-foodie.jpg")
experience.photos.attach(io: file, filename: "stock.jpg", content_type: "image/jpg")
experience.save!

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save!

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
  description: 'Main Yarra Trail, Richmond, Victoria',
  address: "The Open road",
  instructions: "Follow Jan, or if you can't keep up Ryan is happy to take you on a more relaxed ride",
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
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save
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
  address: "Birdwood Ave, Melbourne, Victoria",
  instructions: "Bring a picnic blanket and meet at 6pm near the Observatory",
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
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save

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
  address: "Home",
  instructions: "Don't eat beforehand",
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
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save

  rating = Rating.new(
    stars: 5,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Roadtrip with ServoMate',
  description: "All the fun of the journey without the hassle",
  address: "440 Collins St, Melbourne, Victoria ",
  instructions: "If you kick the tires and nod your head in a sombre manner people will think you know what you are doing",
  cost: 0,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1532224589403-0e70ee166b49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80")
experience.photos.attach(io: file, filename: "road.jpg", content_type: "image/jpg")
experience.save!

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save
  y = rand(3..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end
# new experiences below

experience = Experience.new(
  title: 'Yoga Class with Guru Paal',
  description: "So exclusive, no one shows. Yoga positions, moderate movement patterns, breath practise, supported silent meditation, and guided relaxation are all included in this class to help you become more attentive of your breathing and body as well as your partner.",
  address: "43 Stewart Street, Richmond, Melbourne, Victoria",
  instructions: "Enrol in Le wagon's Fullstack Bootcamp to discover it's not actually included.",
  cost: 0,
  time: "5-6 hours"
)
file = URI.open("https://https://images.unsplash.com/photo-1518459031867-a89b944bffe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2041&q=80")
experience.photos.attach(io: file, filename: "yoga.jpg", content_type: "image/jpg")
experience.save!

file = URI.open("https://images.unsplash.com/photo-1588286840104-8957b019727f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
experience.photos.attach(io: file, filename: "yoga1.jpg", content_type: "image/jpg")
experience.save!

file = URI.open("https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3133&q=80")
experience.photos.attach(io: file, filename: "yoga2.jpg", content_type: "image/jpg")
experience.save!

rand(1..4).times do
  experience.mood_list.add(MOOD.sample)
end
experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save
  y = rand(3..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end
# add exp

experience = Experience.new(
  title: 'Indoor Rock Climbing for Two',
  description: "Premier indoor rock climbing and bouldering venues, this spot houses rock climbing, bouldering, high ropes course and training for all ages and sizes. Offering an exceptional 25 fully automated climbing stations, climbing walls, cargo nets, caving and even spider mountain and over 300-square-metres of bouldering with a large concession area to chill, they have nonpareil. They also offer rock climbing coaching classes for kids and adults and their most recognized Top Rope Climbing experience.",
  address: "41 Down Street, Collingwood ",
  instructions: "Meet at Collingwood and dress in active wear",
  cost: 99,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1577434150092-38785fc2074d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3387&q=80")
experience.photos.attach(io: file, filename: "rock.jpg", content_type: "image/jpg")
experience.save!

file = URI.open("https://images.unsplash.com/photo-1577434150722-99631d08e57b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
experience.photos.attach(io: file, filename: "rock1.jpg", content_type: "image/jpg")
experience.save!

file = URI.open("https://images.unsplash.com/photo-1501450753566-4977b58843ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80")
experience.photos.attach(io: file, filename: "rock2.jpg", content_type: "image/jpg")
experience.save!

experience.mood_list.add("Active")
experience.mood_list.add("Indoor")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Date.today,
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save
  y = rand(3..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

# test couples
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

SpecialDay.create(
  couple: Couple.last,
  title: "anniversary",
  date: Date.today + 1
)
