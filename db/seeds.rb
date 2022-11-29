# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
frank.save

bertha = User.create(
  first_name: 'Bertha',
  last_name: 'liaison',
  email: 'bertha@lewagon.com',
  password: 'berthatest',
  couple: couple
)

couple = Couple.new
couple.save

experience = Experience.new(
  title: 'zoomies playdate',
  description: 'Playtime for Dogs',
  address: "park near you",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "1-2 hours"
)

experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
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
25.times do
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
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
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
25.times do
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
  title: 'Stock Check',
  description: 'Stonks!',
  address: "Office near you",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "30 minutes"
)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
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
25.times do
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
  title: 'Gruappo Ride',
  description: 'My Legs hurt',
  address: "The Open road",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "45 minutes"
)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
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
25.times do
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
  title: 'Star Gazing',
  description: 'Astrolog to the rescue',
  address: "Look up stupid",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "10 minutes"
)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
experience.mood_list.add(MOOD.sample)
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
25.times do
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

puts "seed done"
