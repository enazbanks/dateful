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


MOOD = %w[Night Romantic Adventurous Relaxed Playful Spicy Foodie Instagrammable Pamper Active Retro Roadtrip Outdoors Home]
FEATURE = %w[Food Transport Accessible Children Pets]
REVIEW = ["I tried to behead it but got truffle all over it.", "talk about sadness!", "My vulture loves to play with it.", "It only works when I'm Samoa.", "talk about pleasure.", "this date is honest.", "It only works when I'm Bahrain.", "I tried to behead it but got truffle all over it.", "heard about this on jump-up radio, decided to give it a try.", "My neighbor Alida has one of these. She works as a gambler and she says it looks spotless.", "talk about anticipation!", "This date works considerably well. It mildly improves my basketball by a lot.", "I saw one of these in Haiti and I bought one.", "I tried to cremate it but got Turkish Delight all over it.", "My neighbor Eller has one of these. She works as a butler and she says it looks smoky.", "My tyrannosaurus rex loves to play with it.", "talk about hatred!!!", "The box this comes in is 3 centimeter by 5 kilometer and weights 13 ounce!!", "I tried to belly-flop it but got Turkish Delight all over it.", "This date works really well. It wildly improves my baseball by a lot.", "This date works outstandingly well. It beautifully improves my basketball by a lot.", "talk about sadness!!", "My neighbor Isabela has one of these. She works as a taxidermist and she says it looks monochromatic.", "talk about contempt!!!", "This date works considerably well. It recklessly improves my basketball by a lot.", "It only works when I'm Samoa.", "This date works really well. It wildly improves my baseball by a lot.", "My neighbor Albertina has one of these. She works as a gardener and she says it looks humongous.", "I tried to grab it but got bonbon all over it.", "This date works excessively well. It mortally improves my golf by a lot.", "i use it hardly when i'm in my prison.", "I saw one of these in Spratly Islands and I bought one.", "heard about this on dance-rock radio, decided to give it a try.", "My co-worker Mohamed has one of these. He says it looks brown.", "this date is honest.", "talk about pleasure!", "talk about irritation.", "The box this comes in is 3 inch by 6 centimeter and weights 15 ounce!", "My neighbor Albertina has one of these. She works as a gardener and she says it looks humongous.", "My co-worker Reed has one of these. He says it looks microscopic.", "talk about sadness!", "heard about this on timba radio, decided to give it a try.", "My neighbor Julisa has one of these. She works as a bartender and she says it looks crooked.", "My neighbor Isabela has one of these. She works as a taxidermist and she says it looks monochromatic.", "i use it for 10 weeks when i'm in my sauna.", "i use it until further notice when i'm in my station.", "The box this comes in is 4 meter by 5 foot and weights 18 kilogram.", "I saw one of these in Cote d'Ivoire and I bought one.", "i use it never again when i'm in my station.", "this date is top-notch."]

1.times do
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
  description: "For the dog lovers. Zoomies offers a terrific, fun way to connect with other pet parents. Sign up to the new social media app for furballs. Get swiping and match with your doggo's new fur-friend. Orgainse a playdate at a park near you. A great opportunity to meet others while spending time with your loved one.",
  address: "104 Coppin Street, Richmond, Victoria",
  instructions: "Bring your best boy doggo, head to the nearest park with your partner and don't forget the frisbee",
  secret_instructions: "Wear active clothes, Turn up at the park just after lunch",
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
experience.mood_list.add("Outdoors")
experience.feature_list.add("Pets")
experience.feature_list.add("Accessible")
experience.feature_list.add("Transport")
experience.feature_list.add("Children")
experience.save!


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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
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
  instructions: "Meet at Novotel, Gold Coast. You'll be picked up by Balters tour bus. Dress to impress!",
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
experience.mood_list.add("Outdoors")
experience.mood_list.add("Active")
experience.feature_list.add("Food")
experience.feature_list.add("Transport")
experience.feature_list.add("Accessible")
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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Camping Weekend',
  description: "Barely an hour out of the city, Wombat State Forest is perfect for a quick and easy getaway. Skirted by The Great Dividing Range, the area is surrounded by extinct volcanoes hidden within the forest. And if the weather heats up and you’re keen to cool off, it’s not too far from Lederderg Gorge to take a dip. On top of all that, if you’re an avid mountain bike rider, the forest offers more than 100kms of tracks.",
  address: "Sylvia Creek Road, Toolangi, Victoria",
  instructions: "We recommend dressing for the weather which might mean bringing a hat, sunscreen, insect repellent, and an umbrella. Always bring a jumper and coat in case the weather changes.",
  secret_instructions: "Bring comfortable clothing for all weathers. Pack overnight gear and trainers you would be comfortable walking in.",
  cost: 0,
  time: "1-2 days"
)
file = URI.open("app/assets/images/couple_camping.png")
experience.photos.attach(io: file, filename: "app/assets/images/couple_camping.png", content_type: "image/png")

file = URI.open("https://images.unsplash.com/photo-1425913397330-cf8af2ff40a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80")
experience.photos.attach(io: file, filename: "camping1.png", content_type: "image/png")

file = URI.open("https://images.unsplash.com/photo-1476231682828-37e571bc172f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80")
experience.photos.attach(io: file, filename: "camping2.png", content_type: "image/png")



experience.mood_list.add("Outdoors")
experience.mood_list.add("Relaxed")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Active")
experience.mood_list.add("Adventurous")
experience.feature_list.add("Pets")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")
experience.feature_list.add("Transport")
experience.save!

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Take Stock Check',
  description: "For the couples who are in it for the long haul and want to retire early. Take Stock offers the greatest potential for growth both romantically and finacially. Hop online and start checking out the latest news, trends and tweets then you can start investing! Rekindle the flame with your loved one at home with a click of a button.",
  address: "At the comfort of your own home",
  cost: 0,
  time: "30 minutes",
  instructions: "Bring your phone or laptop fully charged and dress comfy.",
  secret_instructions: "Dress comfy and charge your device for 7:30pm"
)
file = URI.open("https://images.unsplash.com/photo-1526948531399-320e7e40f0ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "stock.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1540553016722-983e48a2cd10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "stock1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1493958187845-a4aee2466f2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2074&q=80.jpg")
experience.photos.attach(io: file, filename: "stock.2jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Home")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Cycle with Gruappo',
  description: "Couples that ride together, stay together. Download the hottest new app, Gruappo and join a group ride at Red Hill Trail where you will cycle to your heart's content while enjoying a picturesque view. Cycling with your partner can strengthen your relationship and brings the two of you together.",
  address: "Argyle Street, Camden, New South Wales",
  instructions: "Meet guide Jan at the entrance and follow along, or if you can't keep up Ryan is happy to take you on a more relaxed ride",
  secret_instructions: "Have a light lunch, wear something active and head to Argyle street by 2pm",
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
experience.mood_list.add("Outdoor")
experience.feature_list.add("Transport")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Scuba Diving',
  description: "Want to learn scuba diving in Melbourne? Join us at Aquability to expand your knowledge and skills by enrolling in a scuba diving course. With courses from PADI, IANTD and AIMA/NAS, we offer scuba diving training for everyone from beginner level to instructor level. Melbourne is an amazing place to dive in Victoria with easy access to a vast array of marine life, centuries old shipwrecks and diverse wall diving that is second to none. Feel free to browse our website to see what we can offer you or call in to see our professional staff at our retail dive shop in Mordialloc.",
  address: "1/270 Lower Dandenong Rd Mordialloc VIC 3195",
  instructions: "Bring your swim gear, a towel, goggles, a warm jumper and refreshments",
  secret_instructions: "Bring your swimmers, a towel, goggles, a warm jumper and refreshments",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "3-4 hours"
)
file = URI.open("https://images.unsplash.com/photo-1544551763-46a013bb70d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80")
experience.photos.attach(io: file, filename: "https://images.unsplash.com/photo-1544551763-46a013bb70d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", content_type: "image/png")

file = URI.open("https://images.unsplash.com/photo-1583212292454-1fe6229603b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80")
experience.photos.attach(io: file, filename: "https://images.unsplash.com/photo-1583212292454-1fe6229603b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1664922114319-4700c0ef74b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80")
experience.photos.attach(io: file, filename: "https://images.unsplash.com/photo-1664922114319-4700c0ef74b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80", content_type: "image/jpg")

experience.mood_list.add("Outdoors")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Active")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Outdoor")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")

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

  y = rand(0..5)
  x = rand(0..5)
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Stargaze with Astrolog',
  description: "Astrolog's stargazing experience will have you wishing upon a star. Learn about space and our Milky Way galaxy with a romantic stargazing night. Snacks and hot cocoa provided.",
  address: "Birdwood Ave, Melbourne, Victoria",
  instructions: "Bring a picnic blanket and meet at 6pm near the Observatory",
  secret_instructions: "6pm dress for outside, head to the space near the Observatory",
  cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
  time: "10 minutes"
)
file = URI.open("app/assets/images/stargazing.png")
experience.photos.attach(io: file, filename: "app/assets/images/stargazing.png", content_type: "image/png")

file = URI.open("https://images.unsplash.com/photo-1444124818704-4d89a495bbae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "star1.jpg", content_type: "image/jpg")

file = URI.open("https://images.unsplash.com/photo-1480569798454-4c8d2d1cf5e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80.jpg")
experience.photos.attach(io: file, filename: "star1.jpg", content_type: "image/jpg")

experience.mood_list.add("Night")
experience.mood_list.add("Relaxed")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Retro")
experience.mood_list.add("Outdoor")
experience.feature_list.add("Transport")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")

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

  y = rand(0..5)
  x = rand(0..5)
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: "Exotic Wolf Encounter",
  description: "Accompany a keeper into the enclosure for a once in a lifetime experience feeding this elusive species. You and your partner will find yourself in awe just watching wolves move around the exhibit waiting for you to offer them your next treat.",
  address: "250 Fussell St, Ballarat East, Victoria",
  instructions: "Dress in protective and active clothing, and meet me at Flinders station",
  secret_instructions: "Dress in protective and active clothing, and meet me at Flinders station",
  cost: 299.00,
  time: "1 - 2 hours"
)

file = URI.open("app/assets/images/wolf_1.png")
experience.photos.attach(io: file, filename: "wolf_2.png", content_type: "image/png")

file = URI.open("app/assets/images/wolf_1.png")
experience.photos.attach(io: file, filename: "wolf_1.png", content_type: "image/png")

file = URI.open("app/assets/images/wolf.png")
experience.photos.attach(io: file, filename: "wolf.png", content_type: "image/png")

experience.mood_list.add("Active")
experience.mood_list.add("Playful")
experience.mood_list.add("Outdoors")
experience.feature_list.add("Pets")
experience.feature_list.add("Transport")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Picnic with Mealful',
  description: "Visit Mealful online and hire a professional chef to create an exquisite and one of a kind dining experience at your chosen location. Meals and picnic set up can be customised to your liking. This is the perfect option for a special day.",
  address: "Central Springs Road, Daylesford, Victoria",
  instructions: "Meet at Daylesford Garden at 12pm and dress beautifully comfy.",
  secret_instructions: "Stylish Casual is the name of the game,  Daylesford Garden 12pm sharp",
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
experience.mood_list.add("Outdoors")
experience.feature_list.add("Transport")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")
experience.feature_list.add("Pets")
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
  x = rand(1..5)
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end
experience = Experience.new(
  title: 'Mayfield Garden Glamping',
  description: "Mayfield is Australia’s largest privately-owned, cool climate garden. With picturesque views, it's one of the most beautiful and breathtaking gardens in Australia. You will be set up in a private luxury glamping tent where you will have access to all 26 themed gardens alongside your own tour guide. Before the sunsets, make your way down to our cellar door for some wine tasting. Dinner and breakfast included, we tailor to all dietary requirements.",
  address: "530 Mayfield Road Oberon, New South Wales",
  instructions: "Wear closed walking shoes and dress for the weather which might mean bringing a hat and sunscreen. ",
  secret_instructions: "Pack an overight bag and make sure to bring a Hat, Comfy Walking Shoes and be ready for a bit of a drive.",
  cost: 25,
  time: "4-6 hours"
)
file = URI.open("https://images.pexels.com/photos/5358788/pexels-photo-5358788.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
experience.photos.attach(io: file, filename: "mayfield1.jpg", content_type: "image/jpg")

file = URI.open("https://img.rezdy.com/PRODUCT_IMAGE/90623/Mayfield_Spring22__24.jpg")
experience.photos.attach(io: file, filename: "mayfield.jpg", content_type: "image/jpg")


file = URI.open("https://i0.wp.com/havewheelchairwilltravel.net/wp-content/uploads/2016/10/Mayfield.jpg?resize=1024%2C678&ssl=1")
experience.photos.attach(io: file, filename: "mayfield2.jpg", content_type: "image/jpg")

experience.mood_list.add("Adventurous")
experience.mood_list.add("Active")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Roadtrip")
experience.feature_list.add("Pets")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")
experience.feature_list.add("Food")
experience.save!


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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Lap Around Mount Pan',
  description: "Mount Panorama is a public road, and as such can be treated like any other road in NSW. The public is more than welcome to ride or walk around the Mount, though we do ask that you exercise caution as there are no footpaths for most of the track. There is a boardwalk of 1.7km from Griffins Bent to the Bathurst Light Car Club near the exit of Forrest's Elbow which winds through a combinationof ground level and elevated section. Although Mount Panorama has a NSW-enforced speed limit of 60km/h, a collision with a vehicle travelling at that speed can seriously or fatally injure a human being. Wear high-visibility when travelling around the Mount to reduce this risk.",
  address: "Mount Panarama Bathurst NSW",
  instructions: "Mount Panorama is located in south Bathurst. The easiest way to get there is to follow the main street of Bathurst, William Street, to the very end (south). Coming from Sydney (east), the Great Western Highway intersects with William Street, from which you turn left. After about 1.5kms, the name changes to Panorama Avenue, which shows you're on the right track. Another 1.5kms from there and you enter Mount Panorama at Murray's Corner",
  secret_instructions: "Strap yourself in",
  cost: 250.00,
  time: "10-30 minutes"
)

file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/26/84/35/bc/frosty-trying-his-best.jpg?w=1200&h=-1&s=1")
experience.photos.attach(io: file, filename: "mtpan.jpg", content_type: "image/jpg")

file = URI.open("https://www.westernadvocate.com.au/images/transform/v1/crop/frm/yqbYpxNMru7TBX8VR5QF63/f70f0685-2697-415f-80fb-fb992a30b27b.jpg/r0_179_3098_1921_w1200_h678_fmax.jpg")
experience.photos.attach(io: file, filename: "mtpan1.jpg", content_type: "image/jpg")

file = URI.open("https://scontent.fmel14-1.fna.fbcdn.net/v/t39.30808-6/308872619_5216760475102964_3801214834768247836_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=CQR4rj1IvDMAX-pnylB&_nc_ht=scontent.fmel14-1.fna&oh=00_AfAuYOU4KVTsmKnXHkk7Vfw0LNKnNRmckNz01or5jInTdg&oe=63963653")
experience.photos.attach(io: file, filename: "mayfield2.jpg", content_type: "image/jpg")

experience.mood_list.add("Adventurous")
experience.mood_list.add("Active")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Roadtrip")
experience.feature_list.add("Transport")
experience.save!


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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Boudoir Photo Shoot',
  description: "It doesn’t matter if you’re a new couple finding their mojo, a long-time partner that wants to rekindle your passion, or you want to celebrate a special moment with your twin flame – it’s always a good time to give boudoir a try.",
  address: "13b Edgar St, Ainslie ACT 2602",
  instructions: "What should be worn to couples boudoir sessions? There isn’t a right or wrong answer to this question because it depends on the couple. Actually, it doesn’t even need to be one thing – you can change outfits throughout the photoshoot.",
  secret_instructions: "Be Ready to be brave, wear something you look stunning in.",
  cost: 300.00,
  time: "1- 2 hours"
)
file = URI.open("https://cdn-ajggd.nitrocdn.com/kMoOFpDlsOVtlYJLrnSRNCQXaUFHZPTY/assets/static/optimized/rev-9b0736f/wp-content/uploads/2021/06/Couples-boudoir-photography-PROPS.jpeg")
experience.photos.attach(io: file, filename: "bodphoto.jpg", content_type: "image/jpg")

file = URI.open("https://cdn-ajggd.nitrocdn.com/kMoOFpDlsOVtlYJLrnSRNCQXaUFHZPTY/assets/static/optimized/rev-9b0736f/wp-content/uploads/2021/06/Couples-boudoir-photography-ATMOSPHERE.jpeg")
experience.photos.attach(io: file, filename: "bodphoto1.jpg", content_type: "image/jpg")

file = URI.open("https://static.wixstatic.com/media/06955d_8b82df8850ed4fc191e0a6a9ac3f9d79~mv2_d_5453_3636_s_4_2.jpg/v1/fill/w_1395,h_930,al_c,q_90/06955d_8b82df8850ed4fc191e0a6a9ac3f9d79~mv2_d_5453_3636_s_4_2.webp")
experience.photos.attach(io: file, filename: "bodphoto2.jpg", content_type: "image/jpg")

experience.mood_list.add("Adventurous")
experience.mood_list.add("Spicy")
experience.mood_list.add("Instagrammable")
experience.feature_list.add("Accessible")
experience.save!


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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Roadtrip with ServoMate',
  description: "All the fun of the journey without the hassle. ServoMate ensures you and your lover will be safe on your journey with no hiccups along the way. Download the app and venture the Great Ocean Road, you'll discover the greatest nature, food, wine and adventure",
  address: "Great Ocean Road, Victoria",
  instructions: "Download ServoMate and be ready by 6am to watch the sunrise on the drive. Dress in active wear",
  secret_instructions: "Prep your favourite playlist and get a good nights sleep ready for a 6am start",
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
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Adventurous")
experience.mood_list.add("Outdoors")
experience.feature_list.add("Pets")
experience.feature_list.add("Children")
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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end
# new experiences below

experience = Experience.new(
  title: 'Yoga with Guru Paal',
  description: "Highly exclusive, rooftop yoga class. Connect with your partner spiritually and physically. Yoga positions, moderate movement patterns, breath practise, supported silent meditation, and guided relaxation are all included in this class to help you become more attentive of your breathing and body as well as your partner.",
  address: "43 Stewart Street, Richmond, Melbourne, Victoria",
  instructions: "Enrol in Le wagon's Fullstack Bootcamp to discover it's not actually included.",
  secret_instructions: "Set your expectations to realistic",
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
experience.mood_list.add("Outdoors")
experience.feature_list.add("Children")
experience.feature_list.add("Transport")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end
# add exp

experience = Experience.new(
  title: 'Indoor Rock Climbing',
  description: "Premier indoor rock climbing and bouldering venues, this spot houses rock climbing, bouldering, high ropes course and training for all ages and sizes. Offering an exceptional 25 fully automated climbing stations, climbing walls, cargo nets, caving and even spider mountain and over 300-square-metres of bouldering with a large concession area to chill, they have nonpareil. They also offer rock climbing coaching classes for kids and adults and their most recognized Top Rope Climbing experience.",
  address: "41 Down Street, Collingwood, Victoria",
  instructions: "Meet at Collingwood and dress in active wear",
  secret_instructions: "Wear active clothes, Head to 41 Down Street Collingwood for 10am",
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
experience.feature_list.add("Transport")
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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Hot Springs Spa',
  description: "Find tranquility in Mornington's dreamy spa house. Spoil your loved one with the relaxation and peace of a private bath. You have the choice of basking under a moonlight bathing sky or journey up to the iconic hilltop pool, followed by a couple's massage, you will never forget.",
  address: "140 Springs Lane, Fingal, Victoria",
  instructions: "Meet at Peninsula Hot Springs and dress comfy",
  secret_instructions: "Comfort over style, be set for pickup at 11am",
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
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Outdoors")
experience.feature_list.add("Accessible")
experience.feature_list.add("Food")
experience.feature_list.add("Transport")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: "Board Games for two",
  description: "Forget snap, now there is a wide range of modern boardgames perfect for that relaxing night in",
  address: "At the comfort of your own home",
  instructions: "Grab a coupy of Lost Cities, Carcasonne, The Crew or your own favourite",
  secret_instructions: "Have your game face ready",
  cost: 0,
  time: "30 - 60 minutes"
)

file = URI.open("https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_28/3396036/200710-fitch-couple-game-jm-1050.jpg")
experience.photos.attach(io: file, filename: "terra.jpg", content_type: "image/jpg")

file = URI.open("app/assets/images/pic1214273.webp")
experience.photos.attach(io: file, filename: "carc.jpg", content_type: "image/png")

file = URI.open("app/assets/images/pic586114.webp")
experience.photos.attach(io: file, filename: "lost.jpg", content_type: "image/jpg")

experience.mood_list.add("Relaxed")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Playful")
experience.mood_list.add("Retro")
experience.mood_list.add("Home")
experience.feature_list.add("Children")

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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: 'Moonlit Cinema',
  description: "Australia’s largest and longest running outdoor cinema, Moonlight Cinema has been a summer staple since 1996 showing your favourite movies under the stars in some of the country’s most iconic inner city green spaces. Moonlight strives to maintain the beautiful botanic parks and gardens we operate in, and to celebrate the stunning natural spaces our capital cities have to offer.",
  address: "155 Newlands Rd, Coburg North, Victoria",
  instructions: "We recommend dressing for the weather which might mean bringing a hat, sunscreen, insect repellent, and an umbrella. Always bring a jumper, coat or blanket in case it cools down as the sun sets.",
  secret_instructions: "Bring a blanket, a warm jumper and some shades.",
  cost: 25,
  time: "2-3 hours"
)

file = URI.open("app/assets/images/outdoor_cinema_1.png")
experience.photos.attach(io: file, filename: "outdoor_cinema_1.png", content_type: "image/png")

file = URI.open("app/assets/images/outdoor_cinema.png")
experience.photos.attach(io: file, filename: "outdoor_cinema.png", content_type: "image/png")

file = URI.open("app/assets/images/popcorn.png")
experience.photos.attach(io: file, filename: "popcorn.png", content_type: "image/png")

experience.mood_list.add("Night")
experience.mood_list.add("Outdoors")
experience.mood_list.add("Relaxed")
experience.mood_list.add("Retro")
experience.feature_list.add("Pets")
experience.feature_list.add("Accessible")
experience.feature_list.add("Children")
experience.feature_list.add("Transport")
experience.feature_list.add("Food")
experience.save!


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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end

experience = Experience.new(
  title: "Icehouse Skating",
  description: "Icehouse is the perfect place for a healthy, active and enjoyable day out. Whether you're a beginner or an ice skating pro, you are guaranteed to have a day jam-packed with fun at the best ice skating rink in Docklands.",
  address: "105 Pearl River Road, Docklands, Victoria",
  instructions: "Dress in warm, active clothes and meet me at Docklands station",
  secret_instructions: "Dress in warm, active clothes and meet me at Docklands station",
  cost: 0,
  time: "30 - 60 minutes"
)

file = URI.open("https://images.pexels.com/photos/6712024/pexels-photo-6712024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
experience.photos.attach(io: file, filename: "xxx.jpg", content_type: "image/jpg")

file = URI.open("https://images.pexels.com/photos/6712126/pexels-photo-6712126.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
experience.photos.attach(io: file, filename: "xxx2.jpg", content_type: "image/png")

file = URI.open("https://images.pexels.com/photos/10556555/pexels-photo-10556555.jpeg")
experience.photos.attach(io: file, filename: "xxxx.jpg", content_type: "image/jpg")

experience.mood_list.add("Active")
experience.mood_list.add("Instagrammable")
experience.mood_list.add("Playful")
experience.mood_list.add("Retro")
experience.feature_list.add("Children")
experience.feature_list.add("Transport")
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
  comment = x > y ? Faker::Restaurant.review : REVIEW.sample
  y = x if x > y
  rating = Rating.new(
    stars: y,
    comment: comment
  )
  rating.booking = booking
  rating.save
end


# test couples
couple = Couple.new
couple.save

frank = User.create!(
  first_name: 'Edward',
  last_name: 'liaison',
  email: 'frank@lewagon.com',
  password: 'franktest',
  dob: Faker::Date.between(from: 28.years.ago, to: 29.years.ago)
)

frank.couple = couple
file = URI.open("app/assets/images/ed.png")
frank.avatar.attach(io: file, filename: "frank_avatar.jpg", content_type: "image/jpg")
frank.save

bertha = User.create(
  first_name: 'Bella',
  last_name: 'liaison',
  email: 'bertha@lewagon.com',
  password: 'berthatest',
  couple: couple,
  dob: Faker::Date.between(from: 28.years.ago, to: 29.years.ago)
)
file = URI.open("app/assets/images/bel.png")
bertha.avatar.attach(io: file, filename: "bertha.png", content_type: "image/png")
bertha.save

SpecialDay.create(
  couple: Couple.last,
  title: "anniversary",
  date: Date.today + 1
)
