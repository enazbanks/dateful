
MOOD = %w[Romantic Adventurous Relaxed Playful Spicy Foodie Instagrammable Pamper Active Retro Roadtrip Outdoors Home]
FEATURE = %w[Food Transport Accessible Children Pets]
REVIEW = ["I tried to behead it but got truffle all over it.", "talk about sadness!", "My vulture loves to play with it.", "It only works when I'm Samoa.", "talk about pleasure.", "this date is honest.", "It only works when I'm Bahrain.", "I tried to behead it but got truffle all over it.", "heard about this on jump-up radio, decided to give it a try.", "My neighbor Alida has one of these. She works as a gambler and she says it looks spotless.", "talk about anticipation!", "This date works considerably well. It mildly improves my basketball by a lot.", "I saw one of these in Haiti and I bought one.", "I tried to cremate it but got Turkish Delight all over it.", "My neighbor Eller has one of these. She works as a butler and she says it looks smoky.", "My tyrannosaurus rex loves to play with it.", "talk about hatred!!!", "The box this comes in is 3 centimeter by 5 kilometer and weights 13 ounce!!", "I tried to belly-flop it but got Turkish Delight all over it.", "This date works really well. It wildly improves my baseball by a lot.", "This date works outstandingly well. It beautifully improves my basketball by a lot.", "talk about sadness!!", "My neighbor Isabela has one of these. She works as a taxidermist and she says it looks monochromatic.", "talk about contempt!!!", "This date works considerably well. It recklessly improves my basketball by a lot.", "It only works when I'm Samoa.", "This date works really well. It wildly improves my baseball by a lot.", "My neighbor Albertina has one of these. She works as a gardener and she says it looks humongous.", "I tried to grab it but got bonbon all over it.", "This date works excessively well. It mortally improves my golf by a lot.", "i use it hardly when i'm in my prison.", "I saw one of these in Spratly Islands and I bought one.", "heard about this on dance-rock radio, decided to give it a try.", "My co-worker Mohamed has one of these. He says it looks brown.", "this date is honest.", "talk about pleasure!", "talk about irritation.", "The box this comes in is 3 inch by 6 centimeter and weights 15 ounce!", "My neighbor Albertina has one of these. She works as a gardener and she says it looks humongous.", "My co-worker Reed has one of these. He says it looks microscopic.", "talk about sadness!", "heard about this on timba radio, decided to give it a try.", "My neighbor Julisa has one of these. She works as a bartender and she says it looks crooked.", "My neighbor Isabela has one of these. She works as a taxidermist and she says it looks monochromatic.", "i use it for 10 weeks when i'm in my sauna.", "i use it until further notice when i'm in my station.", "The box this comes in is 4 meter by 5 foot and weights 18 kilogram.", "I saw one of these in Cote d'Ivoire and I bought one.", "i use it never again when i'm in my station.", "this date is top-notch."]


experience = Experience.new(
    title: 'Mayfield Garden Walk',
    description: "Mayfield is Australia’s largest privately-owned, cool climate garden.  It remains a living legacy of the Hawkins family who took much of their inspiration for this project from several of Europe’s most significant horticultural destinations.\nVisitors can also enjoy a unique regional dining experience at Mayfield’s garden restaurant, and it also offers a luxurious glamping experience during its Spring, Autumn and Summer festivals.",
    address: "530 Mayfield Road Oberon NSW 2787 Australia",
    instructions: "We recommend wearing closed walking shoes and dressing for the weather which might mean bringing a hat, sunscreen, insect repellent, and an umbrella.  Always bring a jumper or coat, Mayfield is located 1000m above sea level and the weather can turn quickly.  We feel that the European style weather we sometimes experience in Oberon sits comfortably with our garden - don’t let a little rain, mist or snow get in the way of a good tramp - we love the cooler weather here, just dress appropriately and finish the day with a glass of wine or a hot drink in our restaurant. Don’t let the weather stand in the way of exploring this beautiful garden!",
    secret_instructions: "Bring a hat, Comfy Walking Shoes and be ready for a bit of a drive.",
    cost: 25,
    time: "4-6 hours"
  )
  file = URI.open("https://img.rezdy.com/PRODUCT_IMAGE/90623/Mayfield_Spring22__24.jpg")
  experience.photos.attach(io: file, filename: "mayfield.jpg", content_type: "image/jpg")
  
  file = URI.open("https://img.rezdy.com/DESIGN_BASIC/90623/REZDY_bannerAerial_Shot_By_Melissa_Millard_lg.jpg")
  experience.photos.attach(io: file, filename: "mayfield1.jpg", content_type: "image/jpg")
  
  file = URI.open("https://i0.wp.com/havewheelchairwilltravel.net/wp-content/uploads/2016/10/Mayfield.jpg?resize=1024%2C678&ssl=1")
  experience.photos.attach(io: file, filename: "mayfield2.jpg", content_type: "image/jpg")
  
  experience.mood_list.add("Adventurous")
  experience.mood_list.add("Active")
  experience.mood_list.add("Outdoors")
  experience.mood_list.add("Instagrammable")
  experience.mood_list.add("Roadtrip")
  experience.feature_list.add("Pets")
  experience.feature_list.add("Accessible")
  experience.feature_list.add("Children")
  experience.feature_list.add("Pets")
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
    title: 'Lap Around Mount Panarama',
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
    title: 'Boudior Photo Shoot',
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