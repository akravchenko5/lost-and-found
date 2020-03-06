require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Conversation.destroy_all
Item.destroy_all
User.destroy_all

ADDRESS = [
  'Smedgata 35A, 0651 Oslo',
  'Galgeberg 3F, 0657 Oslo',
  'Karl Johans gate 34, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo',
  'Stjerneblokkveien 5, 1083 Oslo',
  'Mortensrudveien 38, 1283 Oslo',
  'Christoffer Hellums vei 29, 0950 Oslo',
  'Freserveien 21, 0195 Oslo',
  'Ensjøveien 21D, 0655 Oslo',
  'Dronning Eufemias gate 65, 0194 Oslo',
  'Rubina Ranas gate 7, 0190 Oslo',
  'Rådhusgata 11, 0151 Oslo',
  'Trondheimsveien 8, 0560 Oslo',
  'Øvre Slottsgate 16, 0157 Oslo',
  'Oscars gate 81, 0256 Oslo',
  'Youngstorget 2, 0181 Oslo',
  'Møllergata 15, 0179 Oslo',
  'Stortingsgata 12, 0161 Oslo',
  'Helgesens gate 44, 0553 Oslo',
  'Ankerveien 127, 0766 Oslo'
]

CATEGORIES = [
    'Animal/Pet',
    'Art',
    'Electronics',
    'Accessories',
    'Clothes',
    'Furnitures',
    'Sports',
    'Transportation',
    'Credit Card',
    'Phone',
    'Keys',
    'Wallet',
    'Other'
]

puts 'Creating users...'
users_attributes = [
  {
    first_name: 'Alex',
    last_name: 'Johnson',
    email: 'alex@gmail.com',
    password: '123456',
    phone_number: '47095092'
  },
  {
    first_name: 'Doris',
    last_name: 'Day',
    email: 'doris@gmail.com',
    password: '123456',
    phone_number: '90028935'
  },
  {
    first_name: 'Jan',
    last_name: 'Olsen',
    email: 'jan@gmail.com',
    password: '123456',
    phone_number: '90023550'
  },
  {
    first_name: 'Joanna',
    last_name: 'Jansson',
    email: 'joanna@gmail.com',
    password: '123456',
    phone_number: '99281054'
  },
  {
    first_name: 'Flo',
    last_name: 'Jackson',
    email: 'flo@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Julian',
    last_name: 'Giersten',
    email: 'julian@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Simen',
    last_name: 'Grytøyr',
    email: 'simen@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Torfinn',
    last_name: 'Weisser',
    email: 'torfinn@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Saio',
    last_name: 'Hansen',
    email: 'saio@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Nikolai',
    last_name: 'Gundersen',
    email: 'nikolai@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Ricardo',
    last_name: 'Portugal',
    email: 'ricardo@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Jérémie',
    last_name: 'Poiraudau',
    email: 'jeremie@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Eivind',
    last_name: 'Omdal',
    email: 'eivind@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Dennis',
    last_name: 'Neely',
    email: 'dennis@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Max',
    last_name: 'Johnson',
    email: 'max@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Monica',
    last_name: 'Santos',
    email: 'monica@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Rune',
    last_name: 'Fredriksen',
    email: 'rune@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Silje',
    last_name: 'Hansen',
    email: 'silje@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Hilde',
    last_name: 'Olsen',
    email: 'hilde@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Jørgen',
    last_name: 'Jørgensen',
    email: 'jorgen@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Espen',
    last_name: 'Rasmussen',
    email: 'espen@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
  {
    first_name: 'Jonas',
    last_name: 'Bendiksen',
    email: 'jonas@gmail.com',
    password: '123456',
    phone_number: '41541450',
  },
]

User.create!(users_attributes)

puts 'Creating items...'

items_attributes = [
  {
    title: 'Knitted Wool Mittens',
    description: 'White mittens with red traditional decoration. I think I lost them close to the bus stop.',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Galgeberg 3F, 0657 Oslo'
  },
  {
    title: 'Smart Watch',
    description: "Lost it while running. It's black.",
    state: 0,
    reward: 200,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Smedgata 35A, 0651 Oslo'
  },
  {
    title: 'Yellow scraf found',
    description: "A yellow scarf with some red dots found at Oslo Mekaniske. It was left under a table in the big room. It's knitted, and it looks kind of home made – in a good way.",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Tøyenbekken 34, 0188 Oslo'
  },
  {
    title: 'Black Cat found in Tøyen',
    description: "Yesterday I found a female lost cat outside my door. She didn't have any necklace or anything, but she was really hungry, so I took her inside. I think the breed is bombay cat, but I not quite sure.",
    state: 1,
    user: User.all.sample,
    category: 'Animal/Pet',
    address: 'Sørligata, 0651 Oslo'
  },
  {
    title: 'Sport bicycle in backyard',
    description: "The last couple of weeks we've had a sport bicycle standing in our backyard. Looks kind of expensive, so I though maybe the owner wants it back. If you tell me the color and brand on a message, you'll get it back :) ",
    state: 1,
    user: User.all.sample,
    category: 'Transportation',
    address: 'Anton Schjøths gate 10, 0454 Oslo'
  },
  {
    title: 'Keychain Bar Bocca',
    description: "Found a keychain when I closed the bar last night. Looks like house keys. There is also a logo attached to it, not sure what it represent, but anyways... Send me a message if you think it yours.",
    state: 1,
    user: User.all.sample,
    category: 'Keys',
    address: 'Thorvald Meyers gate 30, 0555 Oslo'
  },
  {
    title: 'Credit Card in Brugata',
    description: "Lucky you, the owner of this card! Found it in Brugata, not really the place to loose a credit card, huh? :) I didn't find your phone number at 1881, but I got your name from the card. So it's at my place. Just send me a message, and we'll connect.",
    state: 1,
    user: User.all.sample,
    category: 'Keys',
    address: 'Storgata 32, 0184 Oslo'
  },
  {
    title: 'Element skateboard',
    description: "Sombody lost a Element skateboard at Oslo Skatehall? I brought it home... I'm there twice a week, so easy to meet up...",
    state: 1,
    user: User.all.sample,
    category: 'Sports',
    address: 'Stavangergata 28, 0467 Oslo'
  },
  {
    title: 'Louis Vuitton scarf',
    description: "Found a Louis Vuitton scarf outside Astrup Fearnley Museum. Don't want say the color and pattern since it's a expensive item, but if it yours, you know it. PM me and tell me, you'll get it back! :) ",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Strandpromenaden 2, 0252 Oslo'
  },
  {
    title: 'Do you miss a chair?',
    description: "Strangest thing. There is a wooden chair, nice looking also, standing in the street outside our appartment builing. Somebody missing it? ",
    state: 1,
    user: User.all.sample,
    category: 'Furnitures',
    address: 'Essendrops gate 7, 0368 Oslo'
  },
  {
    title: 'Medicine box found',
    description: "I found a medicine box at La Baguette in Storo Storsenter. It's red and have 24 pockets. If you miss one, I'm working in the store next by. I'll bring it to work... ",
    state: 1,
    user: User.all.sample,
    category: 'Other',
    address: 'Vitaminveien 7-9, 0485 Oslo'
  },
  {
    title: 'Wallet found',
    description: "Wallet found at Holtet, Nordstrand. Please contact me if you lost something in the area... Live right next to Brannfjell skole...",
    state: 1,
    user: User.all.sample,
    category: 'Wallet',
    address: 'Ekebergveien 111, 1178 Oslo'
  },
  {
    title: 'Red backpack',
    description: "I found a red backpack at Oslo Camping. It got some school books and a couple of notebooks.",
    state: 1,
    user: User.all.sample,
    category: 'Other',
    address: 'Møllergata 12, 0179 Oslo'
  },
  {
    title: 'Child shoes',
    description: "A pair of pink Converse shoes found at the playground in Sofienbergparken. Yours? PM me!",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Sofienberggata 14, 0558 Oslo'
  },
  {
    title: 'Child shoes',
    description: "A pair of pink Converse shoes found at the playground in Sofienbergparken. Yours? PM me!",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Sofienberggata 14, 0558 Oslo'
  },
  {
    title: 'iPhone X found',
    description: "Found at Litteraturhuset. Please DM me and tell me what kind of screen saver you have, and I know it yours!",
    state: 1,
    user: User.all.sample,
    category: 'Phone',
    address: 'Wergelandsveien 29, 0167 Oslo'
  },
  {
    title: 'Headphones Beats',
    description: "Somebody lost a Beats hedaset? I have a black one found at Enoteca in Frogner.",
    state: 1,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Bygdøy allé 59, 0265 Oslo'
  },
  {
    title: 'Helly Hansen jacket',
    description: "A red Helly Hansen jacket was left at the womens locker room in Frognerbadet. I brought it home if you want it back.",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Middelthuns gate 28, 0368 Oslo'
  },
  {
    title: 'Fishing rod',
    description: "Found a fly fishing rod outside my office. The brand is Gudieline. I'm working at Snøhetta, so come pick it up there if it yours... ",
    state: 1,
    user: User.all.sample,
    category: 'Other',
    address: 'Akershusstranda 21, 0150 Oslo'
  },
  {
    title: 'MacBook charger',
    description: "Been at Fyr and lost a MacBook charger? Don't worry! I got it. Please DM for details...",
    state: 1,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Underhaugsveien 28, 0354 Oslo'
  },
  {
    title: 'Paiting of a cow',
    description: "The last few weeks we've had a painting standing at Månefisken. Nobody knows who's the owner. Anybody here missing a paiting? Come pick it up!",
    state: 1,
    user: User.all.sample,
    category: 'Art',
    address: 'Sagveien 23A, 0459 Oslo'
  },
  {
    title: 'Baby stroller',
    description: "Missing a stroller of the brand Beemoo? I found a red one standing outside Baker Hansen in Torsov. Been standing there for a couple of days. I got it if you want it back",
    state: 1,
    user: User.all.sample,
    category: 'Art',
    address: 'Vogts gate 68, 0477 Oslo'
  },
  {
    title: 'LA Caps found',
    description: "A blue LA basketball caps found at Eventyrbrua. Size L. DM for details.",
    state: 1,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Markveien 67, 0550 Oslo'
  },
  {
    title: 'Personal Diary - Generous Reward',
    description: 'Purple and black cover. It has a lot of written pages and is of great value to me. Please contact me if you have seen it!',
    state: 0,
    reward: 500,
    user: User.all.sample,
    category: 'Other',
    address: 'Karl Johans gate 34, Oslo'
  },
  {
    title: 'Credit Card',
    description: 'Lost my credit card last night at the pub.',
    state: 0,
    reward: 200,
    user: User.all.sample,
    category: 'Credit Card',
    address: 'Paulus Plass 1C, Oslo'
  },
    {
    title: 'Spider-Man Toy',
    description: 'Have you seen my sons Spider-Man?',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Other',
    address: 'Youngstorget 2, 0181 Oslo'
  },
    {
    title: 'Yoga Mat',
    description: 'I had such a nice meditation that I completely forgot my orange yoga mat which was next to the bench when I left park. Any help is greatly appreciated. Namaste! ',
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Sports',
    address: 'Rådhusgata 11, 0151 Oslo'
  },
    {
    title: 'Big Bass Earbuds',
    description: 'Red and black earbuds. Lost on my way to school.',
    state: 0,
    reward: 20,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Sofies Plass 3b, Oslo'
  },
    {
    title: 'Zebra Piñata',
    description: "A big piñata that looks like a Zebra. It's for a birthday-party",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Animal/Pet',
    address: 'Freserveien 21, 0195 Oslo'
  },
  {
    title: 'Black Leather Jacket',
    description: "I inherited it from my grandfather. Please return if found!",
    state: 0,
    reward: 800,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Akersgata 55, Oslo'
  },
    {
    title: 'Ming Vase',
    description: 'White and blue vase from China with beautiful art decoration.',
    state: 0,
    reward: 700,
    user: User.all.sample,
    category: 'Art',
    address:  'Lakkegata 32, Oslo'
  },
    {
    title: 'White Labrador',
    description: "He's five years old and a very kind dog. Responds to Bobby. Please call the phone number on the collar.",
    state: 0,
    reward: 800,
    user: User.all.sample,
    category: 'Animal/Pet',
    address: 'Henrik Ibsensgate 2, Oslo'
  },
   {
    title: 'Red Jumper',
    description: "I left my jumper on the couch, next to the corner table at Kafferiet.",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Clothes',
    address: 'Akersbakken 2, Oslo'
  },
   {
    title: 'Home-made bracelet',
    description: "Plastic beads in different colors and one with the letter 'P'.",
    state: 0,
    reward: 30,
    user: User.all.sample,
    category: 'Accessories',
    address: 'Stjerneblokkveien 5, 1083 Oslo'
  },
   {
    title: 'Water Bottle',
    description: "500 ml. It's black and made of stainless steel, and has a leak-proof seal.",
    state: 0,
    reward: 100,
    user: User.all.sample,
    category: 'Sports',
    address: 'Konowsgate 3, Oslo'
  },
   {
    title: 'Yucca plant',
    description: "A little plant in a brown ceramic pot. Left it on the parking lot.",
    state: 0,
    reward: 20,
    user: User.all.sample,
    category: 'Furnitures',
    address: 'Ensjøveien 21D, 0655 Oslo'
  },
   {
    title: 'Necklace',
    description: "Slim golden necklace with angel.",
    state: 0,
    reward: 150,
    user: User.all.sample,
    category: 'Accessories',
    address: 'Mortensrudveien 38, 1283 Oslo'
  },
   {
    title: 'Ruter pass',
    description: "My grandmother lost her ruter pass card on the Majorstua metro-station! Please help!",
    state: 0,
    reward: 300,
    user: User.all.sample,
    category: 'Credit Card',
    address: 'Valkyriegata 21, 0366 Oslo'
  },
   {
    title: 'Billabong Wallet',
    description: "Navy blue, contains a lot of coupon cards and a student-id",
    state: 0,
    reward: 100,
    user: User.all.sample,
    category: 'Wallet',
    address: 'Rubina Ranas gate 7, 0190 Oslo'
  },
   {
    title: 'Mountain-Fox Backpack',
    description: "It's an olive-green backpack. Has a few books in it and a lunch-box(throw out!)",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Other',
    address: 'Christoffer Hellums vei 29, 0950 Oslo'
  },
   {
    title: 'Suitcase with combination lock',
    description: "Fortified secret agent suitcase with self-incinerating mechanism if picked. Contains top secret documents. Anonymous exchange.",
    state: 0,
    reward: 1000,
    user: User.all.sample,
    category: 'Transportation',
    address: 'Stortingsgata 12, 0161 Oslo'
  },
   {
    title: 'Smart Phone',
    description: "Chineese brand, has a mark of a fall on the top right corner.",
    state: 0,
    reward: 500,
    user: User.all.sample,
    category: 'Electronics',
    address: 'Øvre Slottsgate 16, 0157 Oslo'
  },
   {
    title: 'Shorts',
    description: "Forgot my cool surf-shorts at the Sauna House close to the Opera.",
    state: 0,
    reward: 50,
    user: User.all.sample,
    category: 'Sports',
    address: 'Kirsten Flagstads Plass 1, 0150 Oslo'
  }
]

Item.create!(items_attributes)

puts 'Creating reviews...'

reviews_attributes = [
  {
    content: 'Great experience!',
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: 'So helpful. Thank you!',
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: 'Nice person',
    rating: 4,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Didn't show up, and I never got my item back",
    rating: 2,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "So happy that you helped me out!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Thanks for finding my wallet!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Claimed to own something he didn't own!",
    rating: 1,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Very nice, thanks!",
    rating: 4,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Made my day! Cheers!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Thanks for helping me out!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "You are truly a saint!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "You're a saint!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "The best experience!",
    rating: 5,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Took some time, but got my scarf back...",
    rating: 3,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },
  {
    content: "Good experience",
    rating: 4,
    reviewer: User.all.sample,
    reviewed: User.all.sample
  },


]


Review.create!(reviews_attributes)




puts 'Finished!'
