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


MOOD = %w[Romantic Adventurous Relaxed Playful Spicy Foodie Instagrammable Pamper Active Retro Roadtrip]

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
  title: 'Zoomies Playdate',
  description: 'For the dog lovers. Sign up to the new social media app for furballs, Zoomies! Zoomies offers a terrific, fun way to connect with other pet parents. A great opportunity to make new friends while spending time with your loved one.',
  address: "104 Coppin Street, Richmond, Victoria",
  instructions: "Bring your best boy doggo, head to the nearest park with your partner and don't forget the frisbee",
  secret_instructions: "Wear active clothes, Turn up at the park just after lunch"
  cost: 0,
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
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
    instructions: "none",
    suprise: false,
    status: 3
  )

  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save

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
  title: 'Balters Beer Tour',
  description: "So many Balters! Explore the flavors of the Balters on this guided beer and food day tour. Starting from Gold Coast, your culinary adventure includes visits to several hand-picked wineries, a seasonal 2-course lunch at a beautiful cellar door, and a trip to a local chocolaterie & ice creamery. You’ll end the day with a trip to a craft brewery, before settling in for the scenic drive back to the city.",
  address: "14 Traders Way, Currumbin Waters, Queensland",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours",
  instructions: "Meet at Novotel, Gold Coast. You'll be picked up by Balters tour bus. Dress to impress!"
  secret_instructions: "Dress nice, we are going somewhere special, be at the Novotell by 3pm"
)
file = URI.open("https://images.unsplash.com/photo-1543791959-12b3f543282a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80.jpg")
experience.photos.attach(io: file, filename: "balter.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1532617094436-572dfd36237b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80.jpg")
experience.photos.attach(io: file, filename: "balter1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1500138911630-61524ea40324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "balter2.jpg", content_type: "image/jpg")

experience.mood_list.add("Foodie")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Active")

experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  title: 'Take Stock Check',
  description: "For the couples who are in it for the long haul and want to retire early. The new innovative app Take Stock offers the greatest potential for growth both romantically and finacially. Rekindle the flame with your loved one at home with a click of a button.",
  address: "Home",
  cost: 0,
  time: "30 minutes",
  instructions: "Bring your phone or laptop fully charged and dress comfy."
  secret_instructions: "Dress comfy and charge your device for 7:30pm"
)
file = URI.open("https://images.unsplash.com/photo-1526948531399-320e7e40f0ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "stock.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "stock1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1493958187845-a4aee2466f2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2074&q=80.jpg")
experience.photos.attach(io: file, filename: "stock.2jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")

experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
    instructions: "none",
    suprise: false,
    status: 3
  )
  booking.couple = Couple.all.sample
  booking.experience = experience
  booking.save

  y = rand(1..5)
  rating = Rating.new(
    stars: y,
    comment: Faker::Restaurant.review
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Cycle with Gruappo',
  description: "Couples that ride together, stay together. Download the hottest new app, Gruappo and join a group ride at Red Hill Trail where you will enjoy a picturesque view. Cycling with your partner can strengthen your relationship and brings the two of you together.",
  address: "Argyle Street, Camden, New South Wales",
  instructions: "Meet guide Jan at the entrance and follow along, or if you can't keep up Ryan is happy to take you on a more relaxed ride",
  secret_instructions: "Have a light lunch, wear something active and head to Argyle street by 2pm"
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "45 minutes"
)
file = URI.open("https://images.unsplash.com/photo-1642986952108-9463d5404cea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "ride.jpg", content_type: "image/jpg")

file = URI.open("https://plus.unsplash.com/premium_photo-1658527187844-fcc4d23793a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80.jpg")
experience.photos.attach(io: file, filename: "ride.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1497514789819-4190972b5575?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "ride.jpg", content_type: "image/jpg")

experience.mood_list.add("Active")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Retro")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  title: 'Stargaze with Astrolog',
  description: "Astrolog's stargazing experience is made for space lovers. Learn about stars and our Milky Way galaxy with a romantic stargazing night. Snacks and hot cocoa provided.",
  address: "Birdwood Ave, Melbourne, Victoria",
  instructions: "Bring a picnic blanket and meet at 6pm near the Observatory",
  secret_instructions: "6pm dress for outside, head to the space near the Observatory"
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "10 minutes"
)
file = URI.open("https://images.unsplash.com/photo-1514770643069-54183731a981?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80.jpg")
experience.photos.attach(io: file, filename: "star.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1444124818704-4d89a495bbae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "star1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1480569798454-4c8d2d1cf5e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "star1.jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Retro")
experience.save

experience.save
rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  title: 'Romantic Picnic with Mealful',
  description: "Hire a professional chef to create an exquisite and one of a kind dining experience at your chosen location with Mealful. Meals and picnic set up can be customised to your liking. This is the perfect option for a special day.",
  address: "Central Springs Road, Daylesford, Victoria",
  instructions: "Meet at Daylesford Garden at 12pm and dress beautifully comfy.",
  secret_instructions: "Stylish Casual is the name of the game,  Daylesford Garden 12pm sharp"
  cost: 130,
  time: "1-2 hours"
)
file = URI.open("https://images.unsplash.com/photo-1630276740239-5d9c23d49531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1625&q=80.jpg")
experience.photos.attach(io: file, filename: "meal.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1527574311754-da5f33012338?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "meal1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1574390696797-d1c894b7ec79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80.jpg")
experience.photos.attach(io: file, filename: "meal2.jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Romantic")
experience.mood_list.add("Foodie")
experience.mood_list.add("Instagrammable")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  description: "All the fun of the journey without the hassle. ServoMate ensures you and your lover will be safe on your journey with no hiccups along the way. Drive and venture the Great Ocean Road, you'll discover the greatest nature, food, wine and adventure",
  address: "Great Ocean Road, Victoria",
  instructions: "Download ServoMate and be ready by 6am to watch the sunrise on the drive. Dress in active wear",
  secret_instructions: "Prep your favourite playlist and get a good nights sleep ready for a 6am start"
  cost: 120,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1532224589403-0e70ee166b49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80.jpg")
experience.photos.attach(io: file, filename: "road.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1529424601215-d2a3daf193ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80.jpg")
experience.photos.attach(io: file, filename: "road.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1532224589403-0e70ee166b49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80.jpg")
experience.photos.attach(io: file, filename: "road.jpg", content_type: "image/jpg")

experience.mood_list.add("Active")
experience.mood_list.add("Romantic")
experience.mood_list.add("Foodie")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Adventurous")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  description: "Highly exclusive, rooftop yoga class. Connect with your partner spiritually and physically. Yoga positions, moderate movement patterns, breath practise, supported silent meditation, and guided relaxation are all included in this class to help you become more attentive of your breathing and body as well as your partner.",
  address: "43 Stewart Street, Richmond, Melbourne, Victoria",
  instructions: "Enrol in Le wagon's Fullstack Bootcamp to discover it's not actually included.",
  secret_instructions: "Set your expectations to realistic"
  cost: 0,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1518459031867-a89b944bffe4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2041&q=80")
experience.photos.attach(io: file, filename: "yoga.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1588286840104-8957b019727f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
experience.photos.attach(io: file, filename: "yoga1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1601925260368-ae2f83cf8b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3133&q=80")
experience.photos.attach(io: file, filename: "yoga2.jpg", content_type: "image/jpg")

experience.mood_list.add("Instagrammable")
experience.mood_list.add("Active")
experience.mood_list.add("Spicy")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  address: "41 Down Street, Collingwood, Victoria",
  instructions: "Meet at Collingwood and dress in active wear",
  secret_instructions: "Wear active clothes, Head to 41 Down Street Collingwood for 10am"
  cost: 99,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1577434150092-38785fc2074d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3387&q=80")
experience.photos.attach(io: file, filename: "rock.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1577434150722-99631d08e57b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
experience.photos.attach(io: file, filename: "rock1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1501450753566-4977b58843ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2071&q=80")
experience.photos.attach(io: file, filename: "rock2.jpg", content_type: "image/jpg")

experience.mood_list.add("Active")
experience.mood_list.add("Adventurous")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  title: 'Hot Strings Spa and Massage',
  description: "Find tranquility in Mornington's dreamy spa house. Spoil your loved one with the relaxation and peace of a private bath. You have the choice of basking under a moonlight bathing sky or journey up to the iconic hilltop pool, followed by a couple's massage, you will never forget.",
  address: "140 Springs Lane, Fingal, Victoria",
  instructions: "Meet at Peninsula Hot Springs and dress comfy",
  secret_instructions: "Comfort over style, be set for pickup at 11am"
  cost: 289,
  time: "5-6 hours"
)
file = URI.open("https://images.unsplash.com/photo-1633712132667-663554221b91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80")
experience.photos.attach(io: file, filename: "hotspring.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1582490841511-81e1363fb48c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80")
experience.photos.attach(io: file, filename: "hotspring1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1600334129128-685c5582fd35?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
experience.photos.attach(io: file, filename: "hotspring2.jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Pamper")
experience.mood_list.add("Romantic")
experience.mood_list.add("Spicy")
experience.mood_list.add("Roadtrip")
experience.mood_list.add("Instagrammable")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
  title: "Board Game's for two",
  description: "Forget snap, now there is a wide range of modern boardgames perfect for that relaxing night in",
  address: "At the comfort of your own home",
  instructions: "Grab a coupy of Lost Cities, Carcasonne, The Crew or your own favourite",
  secret_instructions: "Have your game face ready"
  cost: 0,
  time: "30 - 60 minutes"
)
file = URI.open("https://boardgamegeek.com/image/973664/carcassonne")
experience.photos.attach(io: file, filename: "carc.jpg", content_type: "image/jpg")

file = URI.open("https://boardgamegeek.com/image/586114/lost-cities")
experience.photos.attach(io: file, filename: "lost.jpg", content_type: "image/jpg")

file = URI.open("https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_28/3396036/200710-fitch-couple-game-jm-1050.jpg")
experience.photos.attach(io: file, filename: "terra.jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Playful")
experience.save

rand(10..50).times do
  booking = Booking.new(
    when: Faker::Date.between(from: 1.years.ago, to: Date.today),
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
frank.save

bertha = User.create(
  first_name: 'Bertha',
  last_name: 'liaison',
  email: 'bertha@lewagon.com',
  password: 'berthatest',
  couple: couple
)
file = URI.open("https://cdn.pixabay.com/photo/2019/03/21/20/29/eyewear-4071870__340.jpg")
bertha.avatar.attach(io: file, filename: "bertha.png", content_type: "image/png")
bertha.save

SpecialDay.create(
  couple: Couple.last,
  title: "anniversary",
  date: Date.today + 1
)
