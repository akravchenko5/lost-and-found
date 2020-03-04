d# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

puts 'Cleaning database...'
Conversation.destroy_all
Item.destroy_all
User.destroy_all

ADDRESS = [
  ,
  'Karl Johans gate 34, Oslo',
  'Paulus Plass 1C, Oslo',
  'Sofies Plass 3b, Oslo',
  'Akersgata 55, Oslo',
  'Lakkegata 32, Oslo',
  'Henrik Ibsensgate 2, Oslo',
  'Akersbakken 2, Oslo',
  'Konowsgate 3, Oslo',
  'Galgeberg 3F, 0657 Oslo',
  'Stjerneblokkveien 5, 1083 Oslo',
  'Mortensrudveien 38, 1283 Oslo',
  'Christoffer Hellums vei 29, 0950 Oslo',
  'Freserveien 21, 0195 Oslo',
  'Ensjøveien 21D, 0655 Oslo',
  'Smedgata 35A, 0651 Oslo',
  'Dronning Eufemias gate 65, 0194 Oslo',
  'Rubina Ranas gate 7, 0190 Oslo'
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


puts 'Creating found items...'

items_attributes = [
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
    address: 'Skur 39, Akershusstranda 21, 0150 Oslo'
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
  }
]


Item.create!(items_attributes)


puts 'Creating lost items...'

items_attributes = [
  {
    title: 'Tittel inn her',
    description: 'Description inn her',
    state: 0,
    reward: 0,
    user: User.all.sample,
    category: 'Category inn her',
    address: 'Schweigaardsgate 34C, Oslo'
  },
]

Item.create!(items_attributes)



puts 'Finished!'
