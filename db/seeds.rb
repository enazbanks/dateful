# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

couple = Couple.new

frank = User.create(
  first_name: 'Frank',
  last_name: 'liaison',
  email: 'frank@lewagon.com',
  password: 'franktest'
)
frank.couple = couple

bertha = User.create(
  first_name: 'Bertha',
  last_name: 'liaison',
  email: 'bertha@lewagon.com',
  password: 'berthatest'
)
bertha.couple = couple

couple = Couple.new

date = Date.new(
    title: 'zoomies playdate',
    description: 'Playtime for Dogs',
    address: "park near you",
    cost: 56.35,
    time: "1-2 hours"
)
date.save
booking = Booking.new(
  when: Date.today,
  instructions: "none",
  suprise: false
  status: 3
)
booking.couple = couple
booking.date = date
booking.save
25.times do
  y = rand(0..5)
  x = rand(0..5)
  y = x if x > y
  rating = Rating.new(
    stars: y
    comment:
  )
  rating.booking = booking
  rating.save
end
